FROM kbase/depl:latest
MAINTAINER kkeller@lbl.gov

# Install the SDK (should go away eventually)
RUN \
  apt-get update && apt-get install -y ant && \
  cd /kb/dev_container/modules && \
  git clone https://github.com/kbase/kb_sdk -b develop && \
  cd /kb/dev_container/modules/kb_sdk && \
  make

# User apt-get instructions here
# RUN apt-get install blah

COPY ./ /kb/module
ENV PATH=$PATH:/kb/dev_container/modules/kb_sdk/bin
RUN cd /kb/module && make && \
   perl -pi -e 's/homes.chicago.kkeller.sdk.kb_sdk.contigcount/kb\/module/g' scripts/*

WORKDIR /kb/module

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
