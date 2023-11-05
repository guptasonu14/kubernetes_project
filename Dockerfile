FROM centos:latest
MAINTAINER sguptabudha@gmail.com

# Install Apache, zip, and unzip
RUN yum install -y httpd zip unzip

# Add the website template ZIP file to the container
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set working directory and extract the template
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port for HTTP access
EXPOSE 80 22



# FROM centos:latest
# MAINTAINER sguptabudha@gmail.com
# RUN yum install -y httpd \
#  zip \
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip photogenic.zip
# RUN cp -rvf photogenic/* .
# RUN rm -rf photogenic photogenic.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80 22
