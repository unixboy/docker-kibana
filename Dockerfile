FROM buildpack-deps:jessie-curl

ENV KIBANA_VERSION 4.0.2
RUN set -x\
 && curl -Ls https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz > /tmp/kibana.tar.gz\
 && [ "c925f75cd5799bfd892c7ea9c5936be10a20b119" = "$(sha1sum /tmp/kibana* | awk '{print $1}')" ]\
 && mkdir -p /opt/\
 && cd /opt/\
 && cat /tmp/kibana* | gunzip - | tar -x\
 && ln -s /opt/kibana* /opt/kibana\
 && rm /tmp/kibana*

ENTRYPOINT ["/opt/kibana/bin/kibana"]
