#!/bin/bash
# tomcat location
cd /usr/local/tomcat7

#shuttingdown the tomcat
echo "shutting down the tomcat server ......"
bin/shutdown.sh

echo pwd
#removing existing war file

rm webapps/myweb.war

#removing extracted webapp(myweb) foloder
rm -rf webapps/myweb

#copy the latest war file
echo "copying latest war file into webapps...."
cp /tmp/myweb.war webapps

#start the tomcat
echo "restarting after copying latest war file"
bin/startup.sh
echo "***************"
echo  "deployed successfully"
echo " **************"
