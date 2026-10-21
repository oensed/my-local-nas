#!/bin/bash

set -e

echo "starting..."

if [ "$EUID" -ne 0 ]; then
  echo "Error: run this script using sudo (sudo ./script.sh)"
  exit 1
fi

apt update && apt install -y samba apache2

chown -R www-data:www-data /var/www/html/
chmod -R 775 /var/www/html/

read -p "Enter username for Samba [default: $SUDO_USER]: " username
username=${username:-$SUDO_USER}

smbpasswd -a "$username"

if grep -q "\[www-share\]" /etc/samba/smb.conf; then
  echo "Warning: [www-share] section already exists in smb.conf. Skipping configuration."
else
  cat << EOF >> /etc/samba/smb.conf

[www-share]
   comment = Apache Web Root
   path = /var/www/html
   browseable = yes
   writable = yes
   valid users = $username
   force user = www-data
   force group = www-data
   create mask = 0664
   directory mask = 0775

EOF
fi

systemctl restart smbd apache2

echo "Done! Samba and Apache2 are configured."
