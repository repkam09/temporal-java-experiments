FROM maven

WORKDIR /usr/src/app

COPY demo-app/src src
COPY demo-app/pom.xml pom.xml

RUN mvn compile

CMD []
