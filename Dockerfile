FROM maven:3.8.5-openjdk-17 as builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -DskipTests -e -B package

FROM amazoncorretto:17
COPY --from=builder /app/target/spring-keyvault-wi-0.0.1-SNAPSHOT.jar /app.jar
# Kubernetes runAsNonRoot requires USER to be numeric
USER 65532:65532
CMD ["java","-jar","/app.jar"]
