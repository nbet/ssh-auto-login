FROM ubuntu:xenial

RUN apt-get update && apt-get install -y python3
RUN apt-get update && apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install parallel-ssh
RUN apt-get update && apt-get install -y ssh
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y expect

COPY go1.11.2.linux-amd64.tar.gz /usr/local
RUN cd /usr/local && tar zxvf go1.11.2.linux-amd64.tar.gz 
ENV GOPATH /root/go
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

WORKDIR /app
COPY *.py ./
COPY *.exp ./
COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

#ENTRYPOINT ["./entrypoint.sh"]
CMD ["./entrypoint.sh"]

