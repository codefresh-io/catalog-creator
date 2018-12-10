echo on

echo 'git configure'
sh git-configure.sh  $USER_EMAIL $USERNAME $PASSWORD
echo 'create catalog'
sh plugin-logic.sh