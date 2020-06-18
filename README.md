# Description

This image was created with the intention of achieving an easier deployment of Zuul Server component on Docker. We are not associated with Netflix OSS in anyway. You can find the official docker image [here](https://hub.docker.com/r/netflixoss/zuul).

# Quick reference

- Maintained by: [General Software Inc Open Projects](https://github.com/General-Software-Inc-Open-Projects/dataries-zuul-server-docker)
- Where to file issues: [GitHub Issues](https://github.com/General-Software-Inc-Open-Projects/dataries-zuul-server-docker/issues)

# What is Zuul Server?

Zuul Server is the front door for all requests from devices and websites to the backend of the Netflix streaming application. As an edge service application, Zuul is built to enable dynamic routing, monitoring, resiliency, and security. 

# How to use this image

## Start a single node 

~~~bash
docker run -itd --name zuul-server -p 8080:8080 --restart on-failure gsiopen/zuul-server:1.0.0
~~~

## Persist data

> This image is runned using a non root user `dataries` who owns the `/opt/zuul-server` folder.

By default, zuul's data and datalog are stored in...


## Connect to Zuul Server from the command line client



## Check logs

By default, Zuul redirects stdout/stderr outputs to the console so you can run the next command to find logs:


# Deploy a cluster


# Configuration

## Volumes

## Environment variables
