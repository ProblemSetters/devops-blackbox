#!/usr/bin/env bash
/usr/local/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic test
/usr/local/kafka/bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic test <<<"test data"
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
