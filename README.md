Role Name
=========

Configures and installs APCUPSd on Linux.

Requirements
------------

This playbook requires the following collections:
  - community.general

Role Variables
--------------

!! Important: No validation is done on the values in the variables, if you input a value that is not supported by an APCUPSd configuration option, this role will not throw errors or warnings.


| **Variable**         | **Purpose**                                          
|----------------------|------------------------------------------------------
| apc_enable_fw_rules  | Create firewall rules for the apcupsd service. If this variable is not set, but apc_nisip or apc_nisport is set or apc_upscable is of type ether then firewall rules will be created.
| apc_hv_cluster_node  | If this is set to true, scripts will be deployed to shutdown VMs and the cluster service.
| apc_enable_killpwr   | Adds -p to the command to run the apcupsd service which will kill power to the outlets on the APC UPS.
| apc_upsname          | Determines the value for the UPSNAME option.         
| apc_upscable         | Determines the value for the UPSCABLE option.        
| apc_upstype          | Determines the value for the UPSTYPE option.         
| apc_device           | Determines the value for the DEVICE option.          
| apc_scriptdir        | Determines the value for the SCRIPTDIR option.       
| apc_pwrfaildir       | Determines the value for the PWRFAILDIR option.      
| apc_nologindir       | Determines the value for the NOLOGINDIR option.      
| apc_onbatterydelay   | Determines the value for the ONBATTERYDELAY option.  
| apc_batterylevel     | Determines the value for the BATTERYLEVEL option.    
| apc_minutes          | Determines the value for the MINUTES option.         
| apc_timeout          | Determines the value for the TIMEOUT option.         
| apc_annoy            | Determines the value for the ANNOY option.           
| apc_annoydelay       | Determines the value for the ANNOYDELAY option.      
| apc_nologon          | Determines the value for the NOLOGON option.         
| apc_killdelay        | Determines the value for the KILLDELAY option.       
| apc_netserver        | Determines the value for the NETSERVER option.       
| apc_nisip            | Determines the value for the NISIP option.           
| apc_nisport          | Determines the value for the NISPORT option.         
| apc_eventsfile       | Determines the value for the EVENTSFILE option.      
| apc_eventsfilemax    | Determines the value for the EVENTSFILEMAX option.   
| apc_upsclass         | Determines the value for the UPSCLASS option.        
| apc_upsmode          | Determines the value for the UPSMODE option.         
| apc_stattime         | Determines the value for the STATTIME option.        
| apc_statfile         | Determines the value for the STATFILE option.        
| apc_logstats         | Determines the value for the LOGSTATS option.        
| apc_datatime         | Determines the value for the DATATIME option.        
| apc_facility         | Determines the value for the FACILITY option.        
| apc_battdate         | Determines the value for the BATTDATE option.        
| apc_sensitivity      | Determines the value for the SENSITIVITY option.     
| apc_wakeup           | Determines the value for the WAKEUP option.          
| apc_sleep            | Determines the value for the SLEEP option.           
| apc_lotransfer       | Determines the value for the LOTRANSFER option.      
| apc_hitransfer       | Determines the value for the HITRANSFER option.      
| apc_returncharge     | Determines the value for the RETURNCHARGE option.    
| apc_beepstate        | Determines the value for the BEEPSTATE option.       
| apc_lowbatt          | Determines the value for the LOWBATT option.         
| apc_outputvolts      | Determines the value for the OUTPUTVOLTS option.     
| apc_selftest         | Determines the value for the SELFTEST option.        
| apc_polltime         | Determines the value for the POLLTIME option.        

Example Playbook
----------------

<!-- Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 } -->

License
-------

MIT

Author Information
------------------

Eric R under Coast Mountains School District 82.
