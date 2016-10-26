# git-autodeploy
Docker image with olipo186/Git-Auto-Deploy

For more information see [olipo186/Git-Auto-Deploy](https://github.com/olipo186/Git-Auto-Deploy)

### Basic use of container

* Pull this image

`docker pull legerete\git-autodeploy`

* Run container

`docker run -v ~/git-auto-deploy.conf.json:/etc/git-auto-deploy.conf.json legerete\git-autodeploy`

### Provide ssh_key for pull

`docker run -v ~/git-auto-deploy.conf.json:/etc/git-auto-deploy.conf.json /path/to/id_rsa:/etc/git-auto-deploy/.ssh/id_rsa:r legerete\git-autodeploy`

### Ports

Server is running on port **8080**

