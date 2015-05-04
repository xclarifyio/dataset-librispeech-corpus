FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=http://www.openslr.org/resources/12/raw-metadata.tar.gz
ENV NAME=raw-metadata
ENV MD5=25eced105e10f4081585af89b8d27cd2

RUN wget -O ./data.tar.gz "$URL" \
 && echo "$MD5  data.tar.gz" > md5sum \
 && md5sum -c md5sum \
 && rm md5sum \
 && gzip -d ./data.tar.gz \
 && mkdir $NAME \
 && tar -x -f ./data.tar -C $NAME \
 && rm -rf ./data.tar

VOLUME /dataset/$NAME

