#!/bin/bash
echo "Installing Jdk 1.8 and update alternatives ...."
figlet JAVA
sudo yum install -y java-1.8.0-openjdk-devel
sudo alternatives --config java 
sudo alternatives --config javac 
echo "Jdk 1.8 installed successfully."
java -version
echo "done."
sleep 3


echo "Installing maven 3.3 and set the path ..."
figlet MAVEN
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
 
echo "Mavnen installed successfully."

mvn -version
echo "done."
sleep 3

echo "Installing git ...."
figlet GIT
sudo yum install git -y
echo "Git installed successfully"
git --version
echo "done."
sleep 3

echo "Installing Jenkins ...."
figlet JENKINS
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install jenkins -y 
sudo chkconfig jenkins on
sudo service jenkins start
sudo service jenkins status
echo "Jenkins installed successfully."
sleep 3

echo "Installing tomcat 7 ..."
figlet TOMCAT
cd /tmp
sudo wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.tar.gz
sudo tar xzf apache-tomcat-7.0.85.tar.gz
sudo mv apache-tomcat-7.0.85 /usr/local/tomcat7
# copy server.xml
# copy tomcat-user.xml

cd /usr/local/tomcat7
bin/startup.sh
echo "tomcat 7 installed successfully."
sleep 3
echo "Installing ansible ..."
figlet ANSIBLE
sudo yum install -y ansible --enablerepo=epel  
echo "Ansible installed successfully."
ansible --version
echo "done."
sleep 3
echo "Installing Docker ..."
figlet DOCKER
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo chkconfig docker on
echo "Docker installed successfully."

docker version
echo "done."
sleep 3
