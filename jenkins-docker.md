```sh Install Jenkins on Docker
docker run -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(which docker):/usr/bin/docker \
  --name jenkins \
  -d jenkins/jenkins:lts
```

```sh
docker run -p 8080:8080 -p 5173:5173 -p 50000:50000 `
  -v "${pwd}/jenkins_home:/var/jenkins_home" `
  -v "C:/Program Files/Docker/Docker/resources/bin/docker.exe:/usr/bin/docker" `
  --name jenkins `
  -d jenkins/jenkins:lts
```

```bash Get the initial admin password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

```bash Running Nginx on Docker
docker run -d \
  --name react-nginx \
  -p 80:80 \
  -v react-app-volume:/usr/share/nginx/html \
  -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf \
  nginx:latest
```

```bash Running in host machine to jenkins use docker on host machine
sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock
```

```bash
docker stop jenkins
docker rm jenkins
```

```sh dang nhap container jenkins
docker exec -it --user root jenkins bash # voi quyen root
docker exec -it jenkins bash

```

```sh cai node
apt-get update
apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
```
