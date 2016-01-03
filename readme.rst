=========================
Dockerizing Aerospike
=========================

:Author: Vladimir Kozlovski
:Contact: inbox@vladkozlovski.com
:Issues: https://github.com/vkozlovski/docker-aerospike/issues
:Docker image: https://hub.docker.com/r/vkozlovski/aerospike/
:Description: Dockerfile to build a Aerospike container image which can be 
              linked to other containers.

:Release notes: http://www.aerospike.com/download/server/
:Official image: https://hub.docker.com/_/aerospike/
:Official GitHub: https://github.com/aerospike/aerospike-server


.. meta::
   :keywords: Aerospike, Docker, Dockerizing
   :description lang=en: Dockerfile to build a Aerospike container image which 
                         can be linked to other containers.

.. contents:: Table of Contents



Introduction
============

Dockerfile to build a Aerospike container image which can be linked to other 
containers.


Installation
============

Pull the latest version of the image from the docker index. This is the 
recommended method of installation as it is easier to update image in the 
future.
::
    docker pull vkozlovski/aerospike:latest

Alternately you can build the image yourself.
::
    git clone https://github.com/vladkozlovski/docker-aerospike.git
    cd docker-aerospike
    docker build -t="$USER/aerospike" .


Quick Start
===========
You can run the default `aerospike` command simply:
::
    docker run -d vkozlovski/aerospike

You can also pass in additional flags to `aerospike`:
::
    docker run -d --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 vkozlovski/aerospike asd --foreground --config-file /opt/aerospike/etc/aerospike.conf

This image comes with a default set of configuration files for `aerospike`, but if you want to provide your own set of configuration files, you can do so via a volume mounted at `/opt/aerospike/etc`:
::
    docker run -d --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 -v "$PWD/etc":/opt/aerospike/etc vkozlovski/aerospike

This image is configured with a volume at `/opt/aerospike/data` to hold the persisted data. Use that path if you would like to keep the data in a mounted volume:
::
    docker run -d --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 -v "$PWD/data":/opt/aerospike/data vkozlovski/aerospike


Upgrading
=========
To upgrade to newer releases, simply follow this 3 step upgrade procedure.

* **Step 1:** Stop the currently running image::

    docker stop aerospike


* **Step 2:** Update the docker image::

    docker pull vkozlovski/aerospike:latest


* **Step 3:** Start the image::

    docker run -d --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 vkozlovski/aerospike:latest