FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=http://www.openslr.org/resources/12/train-clean-360.tar.gz
ENV NAME=train-clean-360
ENV MD5=c0e676e450a7ff2f54aeade5171606fa

RUN wget -O ./data.tar.gz "$URL" \
 && echo "$MD5  data.tar.gz" > md5sum \
 && md5sum -c md5sum \
 && rm md5sum \
 && gzip -d ./data.tar.gz \
 && mkdir $NAME \
 && tar -x -f ./data.tar -C $NAME \
 && rm -rf ./data.tar

VOLUME /dataset/$NAME

