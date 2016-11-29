# Download and install elasticsearch

FROM debian:jessie-backports
MAINTAINER Push Technology "cloudops@pushtechnology.com"

# Install deps and download elasticsearch
RUN apt-get update && apt-get install -y wget openjdk-8-jre m4 && apt-get remove openjdk-6-jre
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.1.tar.gz -O /tmp/elasticsearch.tar.gz 2> /dev/null

# Unzip elasticsearch and put in place
RUN tar zxf /tmp/elasticsearch.tar.gz -C /opt && mv /opt/elasticsearch-5.0.1 /opt/elasticsearch && rm -rf /tmp/elasticsearch.tar.gz

# Install the AWS plugin
RUN /opt/elasticsearch/bin/elasticsearch-plugin install repository-s3
RUN /opt/elasticsearch/bin/elasticsearch-plugin install discovery-ec2
