FROM openjdk:8-jre-alpine
COPY . /opt/app
WORKDIR /opt/app
CMD [ \
  "java", \
  "-jar", \
  "target/app.jar",\
  "server", \
  "example.yml"  \
]


