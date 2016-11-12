```sh root@server
# install packages
yum update -y; yum clean all
yum install -y vim git
yum install -y telnet wget traceroute tcpdump
yum install -y bind-utils # will install dig, nslookup, host, nsupdate
yum install -y iptables iptables-services
yum install -y perl ruby

systemctl disable firewalld
systemctl stop firewalld
systemctl enable iptables
systemctl restart iptables

# add iptables settings(upload local file by scp)

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
# update ssh as password = no
```

```sh devuser@server
# clone git repo
mkdir -v ~/git; cd ~/git
git clone https://github.com/Lhacker/til.git

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
```

```sh devuser@server
# install docker base images
docker pull centos:7
docker pull ubuntu:16.10
docker pull alpine:3.4
~/git/til/docker/base_image/build_centos7.sh
```
