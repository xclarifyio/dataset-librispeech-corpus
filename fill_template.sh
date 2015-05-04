#!/bin/sh

TARGET="$1"
NAME="$2"
URL="$3"
MD5="$4"

cat > $TARGET <<-EOD
FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=${URL}
ENV NAME=${NAME}
ENV MD5=${MD5}

RUN wget -O ./data.tar.gz "\$URL" \\
 && echo "\$MD5  data.tar.gz" > md5sum \\
 && md5sum -c md5sum \\
 && rm md5sum \\
 && gzip -d ./data.tar.gz \\
 && mkdir \$NAME \\
 && tar -x -f ./data.tar -C \$NAME \\
 && rm -rf ./data.tar

VOLUME /dataset/\$NAME

EOD

