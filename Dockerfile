FROM huanqingdong/centos7-jdk8

MAINTAINER Faith <huanqingdong@nosql.tech>

ENV ZK_HOSTS=localhost:2181 \
    KM_VERSION=1.3.3.23 \
    KM_CONFIGFILE="conf/application.conf"

ADD start-kafka-manager.sh /kafka-manager-${KM_VERSION}/start-kafka-manager.sh

RUN mkdir -vp /tmp && \
    cd /tmp && \
    wget https://github.com/huanqingdong/CMAK/releases/download/${KM_VERSION}/kafka-manager-${KM_VERSION}.zip && \
    unzip  -d / kafka-manager-${KM_VERSION}.zip && \
    rm -rf /kafka-manager-${KM_VERSION}.zip && \
    chmod +x /kafka-manager-${KM_VERSION}/start-kafka-manager.sh

WORKDIR /kafka-manager-${KM_VERSION}

EXPOSE 9000
ENTRYPOINT ["./start-kafka-manager.sh"]
