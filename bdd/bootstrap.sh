#!/bin/bash

echo "Installing Desktop..."
apt-get install -y ubuntu-desktop
#setxkbmap es

echo "Installing Java..."
apt-get install -y openjdk-7-jdk

echo "Installing browsers..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
apt-get update
apt-get install -y google-chrome-stable
wget http://chromedriver.storage.googleapis.com/2.14/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm -f chromedriver_linux64.zip
mv chromedriver /usr/bin/.

echo "Installing BDD Assistant..."
cd /opt/
wget https://github.com/TechnologyConversations/TechnologyConversationsBdd/releases/download/0.5.0/bdd-assistant-0.5.0.tar.gz
tar -xzf bdd-assistant-0.5.0.tar.gz
rm -f bdd-assistant-0.5.0.tar.gz
mv -f /vagrant/wikipedia.story /opt/bdd-assistant/data/stories
cd /opt/bdd-assistant
target/universal/stage/bin/tcbdd