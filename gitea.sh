#!/bin/bash

GITEA_VERSION="1.21.8"

apt update && apt upgrade -y
apt install git openssh-server -y
adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git

wget -O gitea https://dl.gitea.io/gitea/$GITEA_VERSION/gitea-$GITEA_VERSION-linux-amd64
chmod +x gitea
mv gitea /usr/local/bin/gitea

mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
chown git:git /var/lib/gitea/{data,indexers,log}
chmod 750 /var/lib/gitea/{data,indexers,log}
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

cat > /etc/systemd/system/gitea.service <<EOF
[Unit]
Description=Gitea (Git with a cup of tea)
After=syslog.target
After=network.target

[Service]
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
ExecStart=/usr/local/bin/gitea web -c /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

[Install]
WantedBy=multi-user.target
EOF

systemctl enable gitea
systemctl start gitea
