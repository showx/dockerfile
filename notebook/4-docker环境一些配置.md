docker环境的一些配置

docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 --env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 --env KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 --env KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 bitnami/kafka:3.7.0


docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 --env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 --env KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 --env KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 --env=KAFKA_BROKER_ID=1 --env=ALLOW_PLAINTEXT_LISTENER=yes bitnami/kafka:3.7.0

docker network connect test kafka

更新 KAFKA_ADVERTISED_LISTENERS：KAFKA_ADVERTISED_LISTENERS 设置为 127.0.0.1 意味着 Kafka 只能从本地连接。如果 PHP 容器和 Kafka 容器在同一个 Docker 网络中，KAFKA_ADVERTISED_LISTENERS 应设置为 Kafka 容器的 IP 地址或服务名。例如，如果 PHP 容器能够通过服务名 kafka 访问 Kafka 容器，可以将其设置为：

env KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092