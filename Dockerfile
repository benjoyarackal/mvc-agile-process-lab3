# Use an official Java runtime as a parent image (JDK 21)
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project WAR file from the target directory to the container
COPY target/*.war app.war

# Expose port 8080 to access the application
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.war"]
