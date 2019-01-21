FROM centos:centos7
MAINTAINER Pedro Pacheco <pedro.pacheco@insa.gov.br>


WORKDIR /opt

RUN yum clean all &&  yum  install -y \
    epel-release  \
    git  \
    sudo \
    curl \
    && curl -sL https://rpm.nodesource.com/setup_9.x | sudo -E bash -  \
    && yum  install -y nodejs  \
    && rm -rf /var/cache/yum   \
    && git clone  http://ck76uYVWQKRo8Nj1Zyju:onG25oe8FryQnX6rBT6a@gitlab.insa.gov.br/developers/frontpage-ui.git



WORKDIR /opt/frontpage-ui

RUN npm install -g @angular/cli && npm install 


ENTRYPOINT ["/usr/bin/ng","serve"]

CMD ["--host","0.0.0.0","--port", "80"]

EXPOSE 80

