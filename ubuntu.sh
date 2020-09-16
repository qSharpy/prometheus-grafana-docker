echo -e "\e[7minitial apt-get update\e[0m"
apt-get update
apt-get install auditd curl systemctl - y
echo -e "\e[7minstall docker from script\e[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
echo -e "\e[7madd watch files for auditd\e[0m"
sed -i -e '$a-w /usr/bin/docker -p wa\n-w /var/lib/docker -p wa\n-w /etc/docker -p wa \n-w /lib/systemd/system/docker.service -p wa\n-w /lib/systemd/system/docker.socket -p wa\n-w /etc/default/docker -p wa\n-w /etc/docker/daemon.json -p wa\n-w /usr/bin/docker-containerd -p wa\n-w /usr/bin/docker-runc -p wa' /etc/audit/audit.rules
echo -e "\e[7mrestart auditd to reload changes\e[0m"
systemctl restart auditd
