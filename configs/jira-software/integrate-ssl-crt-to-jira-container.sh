#!/bin/bash
echo "add ssl.crt to trusted toot certificates on the server"
cd /usr/local/share/ca-certificates/
mkdir jira.company.com
cp /certs/ssl.crt /usr/local/share/ca-certificates/jira.company.com/
chmod 755 /usr/local/share/ca-certificates/jira.company.com
chmod 644 /usr/local/share/ca-certificates/jira.company.com/ssl.crt
update-ca-certificates
echo "add ssl.crt to the OpenJDK 11 keystore"
/opt/java/openjdk/bin/keytool -noprompt -importcert -alias jira.company.com -cacerts -file /certs/ssl.crt -storepass changeit