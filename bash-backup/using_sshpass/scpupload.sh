passwordfile="/home/root/.config/uia/sshremarkable.txt"
uploadfile=$1

sshpass -f $passwordfile \
scp -o StrictHostKeyChecking=no -r \
$uploadfile \
