# Apache Solr customized for Drupal site

This Apache Solr 4.x distribution has been customized to work out of the box with a Drupal 7 installation. Contains the schema distributed with the search_api_solr module

# How to use it

1. Download one of the releases
2. Unpack and run ./start within the directory

Visit the Apache Solr administration interface @ http://localhost:8080/solr

# Notes

1. This is a multi-core setup. By default ``osha`` core is available
2. To create an additional core, copy ``osha`` core to another directory and edit NEWCORE/core.properties to assign a name to the core (directory name) and restart the container
3. To change default Jetty port, edit ``start`` shell script and adjust the ``-Djetty.port`` option to the desired value

# Using with Docker

1. Clone the repository
2. `chown 8983:8983 cores -R`
3. Create a custom `docker-compose.override.yml`


```
version: "2.0"

services:
  solr4:
    container_name: solr4
    restart: unless-stopped
    ports:
      - "127.0.0.1:8985:8983"
```

4. `docker-compose up -d`
