```sh
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
```

```sh
sudo yum install java-1.8.0-openjdk
sudo yum install y jenkins

sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

initial administrator password: /var/lib/jenkins/secrets/initialAdminPassword
admin user name: admin_user
admin password: hoge


setting file: /etc/sysconfig/jenkins

