FROM debian:wheezy

LABEL maintainer="Jean-Sébastien Hedde <jeanseb@au-fil-du.net>, Guillaume LECERF <glecerf@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y git \
                       build-essential \
                       libpcap-dev \
                       libpcre3-dev \
                       lib32ncurses5-dev \
                       autoconf \
                       libtool

ADD . /memkeys

RUN cd /memkeys && \
    ./build-eng/autogen.sh && \
    ./configure --disable-shared \
                --enable-static && \
    make
