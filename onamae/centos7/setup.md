```sh root@server
# install packages
yum update -y; yum clean all
yum install -y epel-release # for install extra packages(e.g. xclip)
yum install -y vim git
yum install -y chrony
yum install -y telnet wget traceroute tcpdump lsof
yum install -y bind-utils # will install dig, nslookup, host, nsupdate
yum install -y iptables iptables-services
yum install -y perl ruby
yum install -y sysstat # for installing sar && iostat command
yum install -y tree
yum install -y tmux

# enable yum-cron.conf
yum list installed | grep yum-cron
vim /etc/yum/yum-cron.conf
# apply_updates = no ===> apply_updates = yes

# enable systemd
systemctl enable chronyd
systemctl start chronyd

# add shell settings
cat <<EOF > /etc/profile.d/alias.sh
alias rm='rm -i'
alias ls='ls --color'
alias docker_i='docker images'
alias docker_ps='docker ps -a'
EOF

cat <<EOF > /etc/profile.d/bash_settings.sh
function cd {
  builtin cd "\$@" && ls
}
EOF

# change that wheel group user can use sudo without pass
visudo
usermod -aG wheel devuser

# could not update ssh port, so ssh is 22
# add ssh public key at root and devuser
# /etc/ssh/sshd_config
#   disable root login
#   update ssh as password = no
```

```sh devuser@server
# clone git repo
mkdir -v ~/git; cd ~/git
git clone https://github.com/Lhacker/til.git

# update git settings
cp ~/git/til/onamae/.gitconfig ~/

# update iptables settings
sudo cp -b ~/git/til/onamae/centos7/iptables /etc/sysconfig/iptables
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl enable iptables
sudo systemctl restart iptables

# install docker
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install -y docker-engine
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo docker run --help

# add docker
if [ -z `sudo grep docker /etc/group` ]; then sudo groupadd docker; fi
sudo usermod -aG docker root
sudo usermod -aG docker devuser
# re-login by devuser

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

```sh devuser@server
# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

```sh devuser@server
# install docker base images
docker pull centos:7
docker pull ubuntu:16.10
docker pull alpine:3.4
~/git/til/docker/base_image/build_centos7.sh
```

```sh root@server
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://yum.kubernetes.io/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
setenforce 0
yum install -y kubelet kubeadm kubectl kubernetes-cni
systemctl enable kubelet && systemctl start kubelet
setenforce 1
```
