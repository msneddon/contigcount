[![Build Status](https://travis-ci.org/kkellerlbl/contigcount.svg?branch=master)](https://travis-ci.org/kkellerlbl/contigcount)

# contigcount
---

The code in this module was created by kb_sdk.  The template Dockerfile was slightly modified.  You will need a cluster.ini file and an ssl dir created by deploy_dev, and will need to edit the Dockerfile to adjust the paths for munging the service start script.

Specify the workspace-url instance in deploy.cfg.

The current implementation does not pass authentication tokens to the workspace.  This will change soon.
