FROM ubuntu:18.04

ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN apt install -y libgomp1 curl vim

RUN rm -rf /var/lib/apt/lists/* 

WORKDIR /root

ADD V-Dimension-0.9.13-1-1f520b4-amd64.deb /root

RUN dpkg -i V-Dimension-0.9.13-1-1f520b4-amd64.deb \
	&& vds-fetch-params \
	&& mkdir .vds 

ADD vds.conf .vds

ENTRYPOINT ["vdsd", "-daemon=0"]

