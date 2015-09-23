FROM kbase/deplbase:latest
# User apt-get instructions here
RUN apt-get update
RUN apt-get -y install ant
WORKDIR /kb/dev_container/modules
RUN git clone https://github.com/kbase/kb_sdk
WORKDIR /kb/dev_container/modules/kb_sdk
RUN git checkout develop
RUN make
COPY ./ /kb/contigcount
WORKDIR /kb/contigcount
ENV PATH=$PATH:/kb/dev_container/modules/kb_sdk/bin
RUN make
RUN perl -pi -e 's/homes.chicago.kkeller.sdk.kb_sdk/kb/g' scripts/*
ENTRYPOINT . /kb/deployment/user-env.sh && /bin/bash ./scripts/start_perl_server.sh
