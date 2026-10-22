docker环境的一些配置

docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 --env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 --env KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 --env KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 bitnami/kafka:3.7.0


docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 --env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 --env KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 --env KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 --env=KAFKA_BROKER_ID=1 --env=ALLOW_PLAINTEXT_LISTENER=yes bitnami/kafka:3.7.0

docker network connect test kafka

更新 KAFKA_ADVERTISED_LISTENERS：KAFKA_ADVERTISED_LISTENERS 设置为 127.0.0.1 意味着 Kafka 只能从本地连接。如果 PHP 容器和 Kafka 容器在同一个 Docker 网络中，KAFKA_ADVERTISED_LISTENERS 应设置为 Kafka 容器的 IP 地址或服务名。例如，如果 PHP 容器能够通过服务名 kafka 访问 Kafka 容器，可以将其设置为：

env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092



docker run -d \
  --name zookeeper \
  -p 2181:2181 \
  -e ZOOKEEPER_CLIENT_PORT=2181 \
  confluentinc/cp-zookeeper:latest


docker run -d \
--name kafka \
-p 9092:9092 \
--link zookeeper:zookeeper \
-e KAFKA_BROKER_ID=1 \
-e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
-e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
-e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
-v $(pwd)/kafka-data:/var/lib/kafka/data \
confluentinc/cp-kafka:latest



docker run -d \
  --name zookeeper \
  -p 2181:2181 \
  -e ZOOKEEPER_CLIENT_PORT=2181 \
  confluentinc/cp-zookeeper:7.4.0


# 启动 Kafka（使用特定版本）
docker run -d \
  --name kafka \
  -p 9092:9092 \
  --link zookeeper:zookeeper \
  -e KAFKA_BROKER_ID=1 \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
  -e KAFKA_NUM_PARTITIONS=6 \
  -v $(pwd)/kafka-data:/var/lib/kafka/data \
  confluentinc/cp-kafka:7.4.0



docker run -d \
  --name kafka \
  -p 9092:9092 \
  --link zookeeper:zookeeper \
  -e KAFKA_BROKER_ID=1 \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
  -e KAFKA_NUM_PARTITIONS=6 \
  confluentinc/cp-kafka:7.4.0


# 进入 Kafka 容器
docker exec -it kafka /bin/bash

# 查看所有主题
kafka-topics --bootstrap-server localhost:9092 --list

# 查看特定主题详情
kafka-topics --bootstrap-server localhost:9092 --describe --topic your-topic-name

# 查看消费者组
kafka-consumer-groups --bootstrap-server localhost:9092 --list

# 查看特定消费者组详情
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group your-group-name

# 实时监控消息流入
kafka-console-consumer --bootstrap-server localhost:9092 --topic your-topic-name --from-beginning

#!/bin/bash

# 监控主题数量
echo "=== Kafka Topics ==="
docker exec kafka kafka-topics --bootstrap-server localhost:9092 --list | wc -l

# 监控消费者组
echo "=== Consumer Groups ==="
docker exec kafka kafka-consumer-groups --bootstrap-server localhost:9092 --list

# 检查 Broker 状态
echo "=== Broker Status ==="
docker exec kafka kafka-broker-api-versions --bootstrap-server localhost:9092

# 监控磁盘使用
echo "=== Disk Usage ==="
docker exec kafka df -h /var/lib/kafka/data


# 创建分区
kafka-topics --create --topic event_register --partitions 7 --replication-factor 1 --bootstrap-server localhost:9092

# 主题增加分区
kafka-topics --bootstrap-server localhost:9092 --alter  --topic reportlog --partitions 6

# 查看分区
kafka-topics --bootstrap-server localhost:9092 --describe --topic reportlog


kafka-topics --bootstrap-server localhost:9092 --create --topic reportlog --partitions 6 --replication-factor 1


要注意网络的问题


