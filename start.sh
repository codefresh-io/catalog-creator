echo on
echo 'git configure'
#sh git-configure.sh  $USER_EMAIL $USERNAME $PASSWORD 
echo 'create catalog' , current branch $CF_BRANCH
sh plugin-logic.sh "$repo" "$indexPath" "$masterBranch"  $CF_BRANCH