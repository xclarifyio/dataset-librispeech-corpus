FROM busybox:latest

RUN mkdir -p /dataset
WORKDIR /dataset

ENV URL=http://www.openslr.org/resources/12/dev-other.tar.gz
ENV NAME=dev-other
ENV MD5=c8d0bcc9cca99d4f8b62fcc847357931

RUN wget -O ./data.tar.gz "$URL" \
 && echo "$MD5  data.tar.gz" > md5sum \
 && md5sum -c md5sum \
 && rm md5sum \
 && gzip -d ./data.tar.gz \
 && mkdir $NAME \
 && tar -x -f ./data.tar -C $NAME \
 && rm -rf ./data.tar

VOLUME /dataset/$NAME

