#!/bin/bash

# Fetch the public IP address of the Lightsail instance
public_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)


# Generate the Apache configuration file with the public IP address
sudo sed -i "s|<PUBLIC_IP>|$public_ip|" /Lightsail-test-app/my-react-app.conf
sudo cp /Lightsail-test-app/my-react-app.conf /opt/bitnami/apache2/conf/bitnami/
sudo chmod 644 /opt/bitnami/apache2/conf/bitnami/bitnami.conf
sudo cp /Lightsail-test-app/bitnami.conf /opt/bitnami/apache2/conf/bitnami/bitnami.conf
sudo sed -i "s|$public_ip|<PUBLIC_IP>|" /Lightsail-test-app/my-react-app.conf
sudo chmod 777 /opt/bitnami/apache2/conf/httpd.conf
sudo chmod 777 /Lightsail-test-app/read.txt
sudo echo $public_ip >> /Lightsail-test-app/read.txt
sudo echo 'Include "/opt/bitnami/apache2/conf/bitnami/my-react-app.conf"' >> /opt/bitnami/apache2/conf/httpd.conf


sudo chmod 777 /Lightsail-test-app/server.js
sudo chmod 777 /Lightsail-test-app/client/src/App.js
sudo chmod +x /Lightsail-test-app/restart_service.sh
# Restart Apache to apply the changes
#sudo /opt/bitnami/ctlscript.sh restart apache
