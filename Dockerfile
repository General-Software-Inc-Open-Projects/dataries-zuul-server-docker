FROM maven:3-jdk-8 as maven

ARG ARTIFACT_NAME=net.gsi.connectors:dataries-zuul-server
ARG ARTIFACT_VERSION=1.0.0
ARG GITHUB_TOKEN

COPY settings.xml ./

RUN sed -i "s|GITHUB_TOKEN|$GITHUB_TOKEN|" settings.xml

RUN mvn dependency:copy -Dartifact=${ARTIFACT_NAME}:${ARTIFACT_VERSION} \
                        -DoutputDirectory=. \
                        -gs settings.xml

FROM openjdk:8-jre-slim
LABEL version="gsi"
LABEL maintainer="Dania Rojas<dania.rojas@generalsoftwareinc.com>"

ENV ZUUL_SERVER_HOME=/opt/zuul-server/

RUN useradd -lrmU dataries

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
        curl && \
    apt-get autoremove --yes && \
    apt-get clean

USER dataries

WORKDIR ${ZUUL_SERVER_HOME}

COPY --chown=dataries:dataries --from=maven dataries-zuul-server-1.0.0.jar \
                                                  ${ZUUL_SERVER_HOME}

COPY --chown=dataries:dataries healthcheck.sh entrypoint.sh /usr/bin/

ENTRYPOINT entrypoint.sh

HEALTHCHECK --interval=30s --timeout=15s --start-period=60s \
    CMD healthcheck.sh
