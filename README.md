# Initial Setup

1. Create a SSH key for ansible, copy it to each machine including the host machine, and adjust ansible.cfg for its location.
2. Log in at least once in each machine via SSH
3. Run setup_master playbook
4. Add your LDAP consumers on inventory.ini
5. Run setup_client playbook
6. Initialize labman database with initialize_db