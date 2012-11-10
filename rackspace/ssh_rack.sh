USER=root
PRIVATE_KEY=$OS_SSH_KEY
SSH_OPT="StrictHostKeyChecking=no"
if [[ -z "$PRIVATE_KEY" ]]; then
   PRIVATE_KEY=~/.ssh/sezame_otvori_se
fi

PUBLIC_IP=`./export_public_ip.rb | sed -e 's/export OS_PUBLIC_IP=//'`

echo "PUBLIC_IP=$PUBLIC_IP"

ssh -o $SSH_OPT -i $PRIVATE_KEY $USER@$PUBLIC_IP

