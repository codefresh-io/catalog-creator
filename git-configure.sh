echo git configure with params $1 $2 $3
USER_EMAIL=$1
USERNAME=$2 
PASSWORD=$3
git config --global credential.helper "/bin/sh -c 'echo username=$USERNAME;echo password=$PASSWORD'"
git config --global user.email "$USER_EMAIL"
git config --global user.name  $USERNAME