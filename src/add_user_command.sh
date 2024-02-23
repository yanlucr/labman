user=${args[user]}

ldapaddgroup $user
ldapadduser $user $user
ldapaddusertogroup $user administrators