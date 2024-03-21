add_group() {
    ldapaddgroup $1
}

add_user_to_group() {
  ldapaddusertogroup $1 $2
}

remove_group() {
    ldapdeletegroup $1
}