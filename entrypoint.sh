#!/bin/bash

java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=prod -jar dataries-zuul-server-1.0.0.jar
