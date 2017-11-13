FROM debian:wheezy
MAINTAINER Jean-Sébastien Hedde <jeanseb@au-fil-du.net>

RUN apt-get update; apt-get install -y automake autoconf libpcap-dev libpcre3-dev libncurses5-dev libtool g++ make; apt-get purge
# touch NEWS README AUTHORS ChangeLog
# WORKSPACE /src
# RUN autoconf
# RUN automake
# RUN ./configure
