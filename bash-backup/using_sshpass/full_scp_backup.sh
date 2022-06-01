sshpass -f /home/root/.config/uia/sshremarkable.txt \
scp -o StrictHostKeyChecking=no -r \
/home/root/.local/share/remarkable/xochitl/* \
remarkable@10.225.148.125:/home/remarkable/backup/
