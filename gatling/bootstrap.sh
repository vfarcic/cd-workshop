#!/bin/bash

echo "Installing Desktop..."
apt-get install -y ubuntu-desktop
#apt-get install -y language-pack-es
#apt-get install -y language-pack-gnome-es language-pack-es-base language-pack-gnome-es-base
#setxkbmap es

echo "Installing Java..."
apt-get install -y openjdk-7-jdk

echo "Installing Gatling..."
wget -O gatling.zip http://goo.gl/o14jQg
unzip gatling.zip
rm -f gatling.zip
mv gatling-charts-highcharts-bundle-2.1.4 /opt/gatling
echo " "
echo "Gatling is installed!"
echo " "
echo "To configure Firefox:"
echo "Open FireFox > Preferences > Advanced > Network > Settings"
echo "Select 'Manual proxy configuration'"
echo "Type 'localhost' as 'HTTP Proxy' and '8000' as 'Port'"
echo ""
echo "To run Gatling Recorder:"
echo "\$ cd /opt/gatling"
echo "\$ sudo bin/recorder.sh"
echo "Click 'Start' in the Recorder UI"
echo "Navigate using Firefox. All actions will be recorded by Gatling."
echo "Click 'Stop & Save' and the session will be saved inside the /opt/gatling/user-files/simulations directory."
echo " "
echo "To run Gatling simulation:"
echo "\$ cd /opt/gatling"
echo "\$ sudo bin/gatling.sh"
echo "Follow instructions..."
echo " "
echo "An example of changed setUp:"
echo "-- Before --"
echo "setUp(scn.inject(atOnceUsers(1))).protocols(httpProtocol)"
echo "-- After --"
echo "  setUp("
echo "    scn.inject(rampUsers(5) over (10 seconds))"
echo "  )"
echo "  .protocols(httpProtocol)"
echo "  .assertions("
echo "    global.responseTime.max.lessThan(500),"
echo "    global.failedRequests.count.is(0)"
echo "  )"