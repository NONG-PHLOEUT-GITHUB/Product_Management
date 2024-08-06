# Use the official Lucee (open-source CFML) image
FROM lucee/lucee6:latest

# Set the working directory
WORKDIR /var/www

# Copy the current directory contents into the container at /var/www
COPY . /var/www

# Expose the default port for ColdFusion
EXPOSE 8888

# Command to run ColdFusion server
CMD ["catalina.sh", "run"]
