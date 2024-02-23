print=${args[--print]}
sync=${args[--sync]}

rm -f time.conf
touch time.conf

for line in $(sqlite3 /home/administrator/labman/labman.db "select * from user_allowedtime;"); do
    IFS='|'
    read -ra userarr <<< "$line"
    user=${userarr[0]}
    allowedtime=${userarr[1]}
    echo "*;*;$user;$allowedtime" >> time.conf
done

echo "Updated time.conf file created"

if [[ $print ]]; then
    cat time.conf
fi

if [[ $sync ]]; then
    ansible-playbook --ask-become-pass sync_time_conf.yml
fi