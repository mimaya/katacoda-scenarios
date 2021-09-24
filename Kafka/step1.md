## Setup Gradle
`
GRADLE_VER=6.5.1
cd /root
wget https://services.gradle.org/distributions/gradle-${GRADLE_VER}-bin.zip
unzip gradle-${GRADLE_VER}-bin.zip 
mv gradle-${GRADLE_VER} gradle
export PATH=$PATH:/root/gradle/bin
`{{execute}}

## Create Zookeeper and Kafka docker container
`
wget https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kafka/files/docker-compose-kafka.yaml
docker-compose -f docker-compose-kafka.yaml up -d
`{{execute}}

