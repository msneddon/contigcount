[![Build Status](https://travis-ci.org/kkellerlbl/contigcount.svg?branch=master)](https://travis-ci.org/kkellerlbl/contigcount)

# contigcount
---

The code in this module was created by kb_sdk.  The template Dockerfile was slightly modified.  You will need a cluster.ini file and an ssl dir created by deploy_dev, and will need to edit the Dockerfile to adjust the paths for munging the service start script.

Here are examples of how to run this image in different modes:

Service mode:

docker run -d -p 9000:5000 --dns 8.8.8.8 -v $DIR/workdir:/kb/module/work dockerhub-ci.kbase.us/contigcount:latest

In this case you have to have workdir with "config.properties" file for templating deploy.cfg. Here is an example:
[global]
job_service_url = https://kbase.us/services/ujs
workspace_url = https://kbase.us/services/ws


Asunc mode:

docker run -v $DIR/workdir:/kb/module/work dockerhub-ci.kbase.us/contigcount:latest async

In this case you have to have "config.properties" file in workdir as for service mode and in addition "token" file and "input.json" file containing RPC request like:

{"params":["KBaseExampleData","Rhodobacter_CACIA_14H1_contigs"],"method":"contigcount.count_contigs","version":"1.1","id":1}