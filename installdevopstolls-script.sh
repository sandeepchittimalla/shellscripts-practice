#!/bin/bash
echo "Installing Jdk 1.8 and update alternatives ...."
banner JAVA
sudo yum install java-1.8.0-openjdk-devel
sudo alternatives --config java 2
sudo alternatives --config javac 2

echo java -version

echo "Jdk 1.8 installed successfully."

echo "Installing maven 3.3 and set the path ..."
banner MAVEN
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
 
echo "Mavnen installed successfully."
echo mvn -version


echo "Installing git ...."
banner GIT
echo yum install git -y
echo "Git installed successfully"
echo git --version

echo "Installing Jenkins ...."
banner JENKINS
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install jenkins -y 
sudo chkconfig jenkins on
sudo service jenkins start
sudo service jenkins status
echo "Jenkins installed successfully."


echo "Installing tomcat 7 ..."
banner TOMCAT
cd /tmp
sudo wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.tar.gz
sudo tar xzf apache-tomcat-7.0.85.tar.gz
sudo mv apache-tomcat-7.0.85 /usr/local/tomcat7
cd /usr/local/tomcat7
bin/startup.sh
echo "tomcat 7 installed successfully."

echo "Installing ansible ..."
banner ANSIBLE
sudo yum install -y ansible --enablerepo=epel  
echo "Ansible installed successfully."
echo ansible --version

echo "Installing Docker ..."
banner DOCKER
sudo yum update -y
sudo yum install docker -y
sudo service docker start
sudo chkconfig docker on
echo "Docker installed successfully."
echo docker --version
