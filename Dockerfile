FROM kbase/deplbase:latest
MAINTAINER KBase Developer
# Install the SDK (should go away eventually)
RUN \
  apt-get update && apt-get install -y ant && \
  cd /kb/dev_container/modules && \
  git clone https://github.com/kbase/kb_sdk -b develop && \
  cd /kb/dev_container/modules/kb_sdk && \
  make

# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# this should already be there, not sure why not
RUN cpanm -i Config::IniFiles

# -----------------------------------------

COPY ./ /kb/module
ENV PATH=$PATH:/kb/dev_container/modules/kb_sdk/bin
RUN cd /kb/module && make

WORKDIR /kb/module

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
