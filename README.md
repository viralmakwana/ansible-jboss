Ansible playbook to deploy on a single host: JBoss EAP Domain Controller + Host. This playbook includes:

* 4 roles
	1. JBoss - in domain mode
        2. JBoss - in host mode, connecting to the domain controller using an admin user
        3. EWS - Apache with mod_cluster
        4. JBoss - Data Grid. Ideally the application running within EAP, will connect using HotRod to the Grids.

This setup will have 2 replicated caches configured. Replication because, eventually there will be another 2 hosts. Certain aspects are assumed within this playbook :

1. Server is subscribed to the RHN

