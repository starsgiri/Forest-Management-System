#!/bin/bash
cd backend
./mvnw clean package -DskipTests
java -Dserver.port=$PORT -jar target/forest-management-system-1.0.0.jar
