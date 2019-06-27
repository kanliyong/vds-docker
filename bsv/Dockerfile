FROM ubuntu:18.04

ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN apt install -y libgomp1 curl vim

RUN apt install -y wget

RUN rm -rf /var/lib/apt/lists/* 


WORKDIR /root

RUN wget https://download.bitcoinsv.io/bitcoinsv/0.2.0/bitcoin-sv-0.2.0-x86_64-linux-gnu.tar.gz \
	&& tar -xzvf bitcoin-sv-0.2.0-x86_64-linux-gnu.tar.gz 
	
# connect=0 不会更新区块
RUN mkdir .bitcoin && touch .bitcoin/bitcoin.conf && \
	echo '\
daemon=0 \n\
connect=0 \n\
server=1 \n\
txindex=1 \n\
listen=1 \n\
rpcbind=127.0.0.1 \n\
rpcport=5011 \n\
rpcuser=bsv \n\
rpcpassword=bsv \n\
rpcallowip=0.0.0.0/0' > .bitcoin/bitcoin.conf

ENTRYPOINT ["bitcoin-sv-0.2.0/bin/bitcoind", "-daemon=0"]
