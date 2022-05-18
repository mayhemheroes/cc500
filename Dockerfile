FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

ADD . /cc500
WORKDIR /cc500
RUN gcc cc500.c -o cc500
