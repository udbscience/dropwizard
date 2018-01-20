FROM openjdk:8-jre-alpine

ARG VCS_REF
ARG BUILD_DATE

ENV GIT_SHA $VCS_REF

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

COPY . /opt/app
WORKDIR /opt/app

RUN adduser -D app_user -h /home/app_user  \
 && chown -R app_user:app_user /opt/app

USER app_user

EXPOSE 8080 8081 8443 8444

CMD [ "./start_app.sh" ]
