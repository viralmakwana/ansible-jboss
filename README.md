This is a simple playbook for deploying JBoss EAP in domain mode, with JBoss JDG modules running in Client/Server mode.
This deployment does not include the software as you need a valid subscription if using RedHat provided binaries. When you have the relevant software place the software place the JBoss EAP + JBoss JDG modules into:

roles/$ROLE/files. 

Due to the nature of the playbook, ansible should automatically pickup these files when the playbook is run. Also ensure that the hosts file corresponds to your environment. This playbook will not run on Ubuntu/Debian/Arch flavors of Linux due to a conditonal check in the playbook. If required this can beremoved so it can run on other environments.

