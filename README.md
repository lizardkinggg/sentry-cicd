# Demo 3

### Plan 

1. **How to** building a CI/CD pipeline for **Sentry** and **Flask app** using **Jenkins**
	* **1.1** **Jenkins**
	* **1.2** **Install shared dependencies**
	* **1.3** **Docker**
	* **1.4** **Ansible**
	* **1.5** **Virtualenv**
	* **1.6** **Pipeline for Sentry**
	* **1.7** **Pipeline for Flask app**
2. **How to** create autostart build jobs

---
# 1. How to building a CI/CD pipeline for Sentry and Flask app using Jenkins

###  Install and configure 

### 1.1 Jenkins

**01**. Before install you are need to install java. *Because it's java applicatoin* :

`sudo apt install openjdk-8-jdk`

**02**. Add the Jenkins Debian repository.

Import the GPG keys of the Jenkins repository using the following **`wget`** command :

`wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -`

**03**. Next, add the Jenkins repository to the system with :

`sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`

**04**. Install Jenkins 

Once the Jenkins repository is enabled, update the **`apt`** package list and install the latest version of Jenkins by typing:

`sudo apt update`

`sudo apt install jenkins`

> Jenkins service will automatically start after the installation process is complete. You can verify it by printing the service status:
> `systemctl status jenkins`

> **All the commands below must be executed on the computer on which Jenkins is installed from a Jenkins user in home directory!!!!!!!!!!!!**

## 1.2 Install shared dependencies

**01**. Updates the package lists for upgrades for packages that need upgrading, as well as new packages that have just come to the repositories :

`sudo apt-get update`

**02**. Install packages :

`sudo apt-get install python python-pip libxmlsec1-dev pkg-config memcached redis-server postgresql unzip`

### 1.3 Docker

**01**. Install Docker:

`sudo apt-get install docker.io`

**02**. To start a systemd service, executing instructions in the service's unit file, use the **`start`** command :

`sudo systemctl start docker`

**03**. To start a service at boot, use the **`enable`** command :

`sudo systemctl enable docker`

**04**. Add user to docker group for using docker command without **`sudo`**:

`sudo usermod -aG docker $USER`

> After all of them , don't forget do logout and login to set your commands 

### 1.4 Ansible

**01**. Install the necessary repository with the command :

`sudo apt-add-repository ppa:ansible/ansible`

**02**. Update **`apt`** with the command :

`sudo apt-get update`

**03**. Install Ansible with the command :

`sudo apt-get install ansible -y`

### 1.5 Virtualenv 

**01**. Installl Virtualenv with the command : 

`sudo apt-get install virtualenv`

**02**. Create virutal environment **-foo**  without **setuptools** : 

`virtualenv --no-setuptools foo`

> It is necessary to fix without it, because due to the failure of the support of the python2, during installation **virtualenv**

**03**. Active environment :

`source foo/bin/active`

**04**. Install setuptools to Python3 :

`pip install -U setuptools`

---

### 1.6 Pipeline for Sentry 

> Created CI / CD for Sentry located in [main.jenkins](https://github.com/lizardkinggg/sentry-cicd/blob/master/main.jenkins) file

### 1.7 Pipeline for Flask app 

> Created CI / CD for Flask app located in [flask.jenkins](https://github.com/lizardkinggg/flask-app/blob/master/flask.jenkins) file

--- 

# 2. How to create autostart build jobs 

**01**. First you need to run jobs through the GUI so that later you can access these jobs through the JenkinsCLI

---

![jenkinscreatebuild](https://i.stack.imgur.com/JavjD.gif)

**02**. Then you need to download the file **`jenkins-cli.jar`** and folow this command 

`sudo mv jenkins-cli.jar / `

---

![jenkinscreatebuild](https://www.decodingdevops.com/wp-content/uploads/2018/07/jenkins-cli-commands.png)

**03**. Then you need to create the init.groovy.d folder in your home directory. In this folder, you need to create groovy files to run jobs when Jenkins starts.
- [ ] Create groovy file and copy this line and change your **user** and **password**, **IP** and **name job**.

`java -jar jenkins-cli.jar -auth admin:admin -s http://35.208.187.233:8080 build build_without_docker_and_ansible`

---

**04**. Sooo , restart your jenkins.service and if you did everything right , you will see that : 

---

![jenkinsbuildpicture](https://camo.githubusercontent.com/5461b42eeccf4dc084d1d0f769eba6185c9cc529/68747470733a2f2f73332d75732d776573742d312e616d617a6f6e6177732e636f6d2f61726775732d6e6f7469666965722d706c7567696e2f6a656e6b696e732d6a6f62732d696e2d71756575652e676966)

