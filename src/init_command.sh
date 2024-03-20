echo "Checking required files"

if [ ! -f "inventory.ini" ]; then
    echo "inventory.ini does not exist, try copying from the provided sample file and adjusting it."
    exit 1
fi

if [ ! -f "common_vars.yml" ]; then
    echo "common_vars.yml does not exist, try copying from the provided sample file and adjusting it."
    exit 1
fi

echo "Running LDAP setup from ansible"
sudo ansible-playbook -b playbooks/setup_provider.yml

echo "Initializing labman database"
initialize_database

echo "All done!"