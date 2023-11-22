FROM openjdk:11
EXPOSE 8080
ADD target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
# Use a base image with Python and Alpine Linux
FROM python:3.8-alpine

# Install Ansible
RUN apk add --no-cache bash openssh-client && \
    pip install ansible

# Create a working directory for Ansible
WORKDIR /ansible

# Set the environment variable for Python to avoid issues
ENV PYTHONPATH /usr/lib/python3.8/site-packages

# Default command when the container starts
CMD ["ansible", "--version"]