# Base image
FROM fedora

# Label metadata
LABEL description="This is my first Dockerfile"
LABEL maintainer="FIDELIS"

# Update and install httpd
RUN yum update -y

RUN yum install -y httpd

# Copy the index.html to Apache web directory
COPY index.html /var/www/html

# Expose port 80
EXPOSE 80

# Start Container with httpd and this is the command start httpd
ENTRYPOINT ["/usr/sbin/httpd"]

# Start container in the foreground
CMD ["-D", "FOREGROUND"]
