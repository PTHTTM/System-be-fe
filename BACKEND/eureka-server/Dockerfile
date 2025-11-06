# Stage 1: Build
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copy Maven wrapper và dependencies
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Cấp quyền thực thi
RUN chmod +x ./mvnw

# Copy source code
COPY src ./src

# Xóa cache cũ và build lại
RUN rm -rf /root/.m2/repository/com/fasterxml/jackson && \
    ./mvnw clean install -DskipTests -U

# Stage 2: Runtime
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8761

HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8761/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]