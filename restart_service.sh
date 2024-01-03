sudo /opt/bitnami/ctlscript.sh stop apache
sudo fuser -k 3000/tcp
sudo fuser -k 3001/tcp
cd /Lightsail-test-app
sudo NODE_OPTIONS='--no-warnings' npm start &
sleep 10
sudo /opt/bitnami/ctlscript.sh restart apache
