# kafka manager Dockerfile
[kafka manager](https://github.com/yahoo/kafka-manager) is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).

## 如何使用

### 可选版本

[1.3.3.23](https://hub.docker.com/layers/huanqingdong/kafka-manager/1.3.3.23/images/sha256-6fc9db75899d9f21ba8129fef19c4dac0bc76ede895ff9ea470c6783643bccf1?context=explore) 

[2.0.0.2](https://hub.docker.com/layers/huanqingdong/kafka-manager/2.0.0.2/images/sha256-6569be31b82a6724ddd3af762018425f029de93dbc03a9bb281a791f1c302edb?context=explore) 

### 快速开始
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="192.168.1.14:2181" -e APPLICATION_SECRET=faith huanqingdong/kafka-manager:1.3.3.23
```
(if you don't define ZK_HOSTS, default value has been set to "localhost:2181")

### 使用docker-compose

- 如果你没有zookeeper

  ```yaml
  zookeeper:
    image: zookeeper
    container_name: kafka-manager-zk
  
  kafka-manager:
    image: huanqingdong/kafka-manager:1.3.3.23
    container_name: kafka-manager
    ports:
      - "9000:9000"
    links:
      - zookeeper
    environment:
      ZK_HOSTS: zookeeper:2181
      KM_USERNAME: admin
      KM_PASSWORD: admin
  ```

  

- 如果你已有zookeeper

  ```yaml
  kafka-manager:
    image: huanqingdong/kafka-manager:1.3.3.23
    container_name: kafka-manager
    ports:
      - "9000:9000"
    environment:
      ZK_HOSTS: 192.168.1.14:2181
      KM_USERNAME: admin
      KM_PASSWORD: admin
  
  ```

  