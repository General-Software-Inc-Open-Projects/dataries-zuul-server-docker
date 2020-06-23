# Description

This image was created with the intention of achieving an easier deployment of Zuul Server component on Docker. We are not associated with Netflix OSS in anyway.

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

## Connect to Zuul Server from the command line client

> This image is runned using a non root user `dataries` who owns the `/opt/zuul-server` folder.

~~~bash
docker exec -it zuul-server bash
~~~

## Check logs

By default, Zuul Sever redirects stdout/stderr outputs to the console so you can run the next command to find logs:

~~~bash
docker logs zuul-server
~~~

# Configuration

## Environment variables

The environment configuration is controlled via the following environment variable groups or PREFIX, if you need to add routes dynamically through environment variables you can do it by replacing NEWSERVICE with your service name, in other case, if you need to edit an existing route you need to do it using SPRING_APPLICATION_JSON:
   
    ZUUL_ROUTES_NEWSERVICE_URL: affects application-prod.yml
    ZUUL_ROUTES_NEWSERVICE_PATH: affects application-prod.yml
    SERVER_PORT: affects application-prod.yml
    SPRING_APPLICATION_JSON= affects application-prod.yml
    
Set environment variables with the appropriated group in the form PREFIX_PROPERTY.

Due to restriction imposed by docker and docker-compose on environment variable names the following substitution are applied to PROPERTY names:

    _ => .
    __ => _
    ___ => -

Following are some illustratory examples:

     SERVER_PORT=8080: sets the server.port property in application-prod.yml
     SPRING_APPLICATION_JSON='{"zuul":{"routes":{"svc":{"url":"http://localhost:8080/api/v1/"}}}}: sets the zuul.routes.svc.url property in application-prod.yml