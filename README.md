# labman

## Initial setup

1. Install _ansible_
2. Create a new SSH Key for ansible
    > `ssh-keygen -t ed25519 -C "ansible"`
3. Copy the ansible SSH Key to every machine that this script will work with
    > `ssh-copy-id -i path/to/ansible/ssh/key username@machine`
2. Clone and cd into this repo
4. Set `private_key_file` in **ansible.cfg** to wherever you stored the ansible SSH key
3. Copy **inventory.ini.sample** to **inventory.ini** (We'll come back to this file later)
4. Copy **common_vars.yml.sample** to **common_vars.yml** and adjust it according to your preferences

We are now ready to run the LDAP provider setup

## LDAP provider setup

> **Note:** _labman_ assumes that the LDAP provider machine is **localhost** (AKA the machine running the script itself) by default

1. Run `./labman init`
2. If no errors occurs, you should now have an LDAP environment ready to use (try running `ldapsearch -x`)

We are now able to run most labman commands and we are ready to proceed to LDAP consumers setup

## LDAP consumers setup

1. Open up **inventory.ini**
2. Add as many hosts as you want below the `[ldap_consumers]` header, following the sample file example
    > **ansible_user** and **ansible_become_password** refers to both the **username** and **password** of an user with administrative access in the corresponding host
3. Run `./labman init consumers`
4. The consumer machines should have rebooted to allow the changes made in LightDM to appear