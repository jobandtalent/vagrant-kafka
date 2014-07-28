#!/bin/bash
#download rpm if not present
if [ ! -f /vagrant/kafka_2.9.2-0.8.1.1.tgz ]; then
    echo Downloading kafka...
    wget http://apache.rediris.es/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz -P /vagrant
fi

echo installing jdk and kafka...
sudo apt-get update
# sudo apt-get -q -y install software-properties-common
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
sudo apt-get -q -y install openjdk-7-jre
pushd /vagrant
  tar -xzvf /vagrant/kafka_2.9.2-0.8.1.1.tgz
popd
echo done installing jdk and kafka
# chmod scripts
chmod u+x /vagrant/scripts/*.sh
