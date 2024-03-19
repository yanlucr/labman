# Initial Setup

1. Create a SSH key for ansible, copy it to each machine including the host machine, and adjust ansible.cfg for its location.
2. Setup up LDAP target and consumers in inventory.ini based on sample file
3. Run setup_master playbook
5. Run setup_client playbook
6. Initialize labman database with initialize_db