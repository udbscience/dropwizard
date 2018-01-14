#!/usr/bin/env bash

APP_JAR=${APP_JAR:-target/app.jar}
APP_PARAMS=${APP_PARAMS:-"server example.yml"}
JAVA_OPTS="${JAVA_OPTS}"

java ${JAVA_OPTS} \
  -jar ${APP_JAR} \
  ${APP_PARAMS}

