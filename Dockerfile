# Use official Maven image with JDK 21
FROM maven:3.9-eclipse-temurin-21 AS build

# Set working directory
WORKDIR /app

# Copy backend source
COPY backend/pom.xml backend/mvnw backend/mvnw.cmd ./
COPY backend/.mvn ./.mvn
COPY backend/src ./src

# Make mvnw executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Use JRE for runtime (smaller image)
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy the built jar from build stage
COPY --from=build /app/target/forest-management-system-1.0.0.jar app.jar

# Expose port (Railway will set PORT env var)
EXPOSE 8080

# Run the application
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
