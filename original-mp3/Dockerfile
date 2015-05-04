FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=http://www.openslr.org/resources/12/original-mp3.tar.gz
ENV NAME=original-mp3
ENV MD5=7e14b6df14f1c04a852a50ba5f7be915

RUN wget -O ./data.tar.gz "$URL" \
 && echo "$MD5  data.tar.gz" > md5sum \
 && md5sum -c md5sum \
 && rm md5sum \
 && gzip -d ./data.tar.gz \
 && mkdir $NAME \
 && tar -x -f ./data.tar -C $NAME \
 && rm -rf ./data.tar

VOLUME /dataset/$NAME

