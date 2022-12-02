#!/bin/sh

## find .service file for apcupsd
systemctl daemon-reload > /dev/null
apcupsd_svc_path=`systemctl status apcupsd.service | awk '/Loaded:/ {print $3}' | sed -r 's/[;\(\)]+//g'`
systemctl_retval="$?"
if [ "$systemctl_retval" != 0 ]; then
  echo "Error running 'systemctl status apcupsd.service' to determine .service file location" >2&
  exit 1
fi

if [ -z "$apcupsd_svc_path" ]; then
  echo "Search for location of apcupsd.service return no results" >&2
  exit 1
fi

## if the service file already has the -p argument then exit
if [ -n "`egrep 'ExecStart=.*-p' $apcupsd_svc_path`" ]; then
  exit 0;
fi

new_svc_content=`sed -r 's/(ExecStart=[\-+ ]*[^ ]*apcupsd)(.*)/\1 -p \2/' $apcupsd_svc_path`
sed_exit_code="$?"
if [ "$sed_exit_code" -ne 0 ]; then
  exit $sed_exit_code;
elif [ -z "$new_svc_content" ]; then
  echo "sed did not return output when attempting to add '-p' to $apcupsd_svc_path" >&2
  exit 1
elif [ -z "`echo "$new_svc_content" | egrep 'ExecStart=.*-p'`" ]; then
  cat<<EOF >&2
sed did not add '-p' to service file contents. sed output:
$new_svc_content
EOF
  exit 1
fi

echo "$new_svc_content" > $apcupsd_svc_path
systemctl daemon-reload > /dev/null

echo "apcupsd.service file changed"
