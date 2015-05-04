FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=http://www.openslr.org/resources/12/test-clean.tar.gz
ENV NAME=test-clean
ENV MD5=32fa31d27d2e1cad72775fee3f4849a9

RUN wget -O ./data.tar.gz "$URL" \
 && echo "$MD5  data.tar.gz" > md5sum \
 && md5sum -c md5sum \
 && rm md5sum \
 && gzip -d ./data.tar.gz \
 && mkdir $NAME \
 && tar -x -f ./data.tar -C $NAME \
 && rm -rf ./data.tar

VOLUME /dataset/$NAME

