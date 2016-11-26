enable systemctl
```sh
docker run -d --privileged --name td-agent centos:7 /sbin/init
docker exec -it td-agent /bin/bash
```
