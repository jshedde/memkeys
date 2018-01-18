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
                       libtool \
                       ruby \
                       ruby-dev \
                       rubygems \
                       build-essential && \
    gem install --no-ri --no-rdoc fpm


ADD . /memkeys

RUN cd /memkeys && \
    ./build-eng/autogen.sh && \
    ./configure --disable-shared \
                --enable-static && \
    make
RUN cd /memkeys/src/ && \
    fpm -s dir \
        -t deb \
        --deb-no-default-config-files \
        -n memkeys \
        -d "libpcre3 >= 8.30" \
        -d "libpcap0.8 >= 1.3.0" \
        -m "Jean-Sebastien Hedde <jshedde@lafourchette.com>" \
        -f \
        -v 0.1 \
        --prefix /usr/bin \
        memkeys
