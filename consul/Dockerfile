FROM novilabs/kibana:4.0.2

# install bifurcate
ENV BIFURCATE_VERSION 0.3.2
RUN set -x\
 && cd /usr/local/bin\
 && curl -Ls https://github.com/novilabs/bifurcate/releases/download/v${BIFURCATE_VERSION}/bifurcate_${BIFURCATE_VERSION}_linux_amd64.tar.gz | gunzip - | tar -x

ENV CONSUL_TEMPLATE_VERSION 0.9.0
RUN set -x\
 && cd /tmp/\
 && curl -Ls https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz | gunzip - | tar -x\
 && mv /tmp/consul-template*/consul-template /usr/local/bin/\
 && rm -rf /tmp/consul-template*\
 && chmod a+x /usr/local/bin/consul-template

COPY config/*.yml* /etc/kibana/config/
COPY config/bifurcate.conf /etc/kibana/config/bifrucate.conf
ENTRYPOINT ["/usr/local/bin/bifurcate","/etc/kibana/config/bifrucate.conf"]
EXPOSE 5601
