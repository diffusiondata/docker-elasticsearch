# Download and install elasticsearch

FROM debian:jessie
MAINTAINER Push Technology "cloudops@pushtechnology.com"

# Install deps and download elasticsearch
RUN apt-get update && apt-get install -y wget openjdk-7-jre m4 && apt-get remove openjdk-6-jre
RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz -O /tmp/elasticsearch.tar.gz 2> /dev/null

# Unzip elasticsearch and put in place
RUN tar zxf /tmp/elasticsearch.tar.gz -C /opt && mv /opt/elasticsearch-1.5.2 /opt/elasticsearch && rm -rf /tmp/elasticsearch.tar.gz

# Install the AWS plugin
RUN /opt/elasticsearch/bin/plugin install elasticsearch/elasticsearch-cloud-aws/2.5.0

# Install Marvel for cluster overview
# Marvel can only be used in development. Requires a licence in production.
# RUN /opt/elasticsearch/bin/plugin install elasticsearch/marvel/latest

# Install BigDesk to monitor Elasticsearch
RUN /opt/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk/2.4.0
