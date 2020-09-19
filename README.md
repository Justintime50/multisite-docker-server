<div align="center">

# Multisite Docker Server

[![Build Status](https://travis-ci.com/Justintime50/multisite-docker-server.svg?branch=master)](https://travis-ci.com/Justintime50/multisite-docker-server)
[![Licence](https://img.shields.io/github/license/justintime50/multisite-docker-server)](LICENSE)

<img src="assets/showcase.png">

</div>

## What Can it Do?

This project serves as the boilerplate or template to setting up a full Docker server for multiple sites or applications. You deserve to spend your time building cool apps and designing sites, not configuring server infra.

### Components

- **Docker:** [Docker](https://docker.com) creates virtual containers to run each component of your app/server.
- **Traefik:** This project uses [Traefik](https://traefik.io) to load balance and route traffic to each site.
- **Nginx/PHP Site:** Uses `Nginx` to serve files and `PHP` to interpret. You can replicate your own sites by copying and modifying this folder for as many sites as you have.
- **MySQL:** Use this container if you'd like to run a database for your application. Alternatively, you can combine the contents of this docker-compose file with the docker-compose file of your site.

## Usage

Once Docker is installed and running, start up the entire project with one command:

```bash
# Copy the MySQL env file
cp src/mysql/db.env.example src/mysql/db.env

# Start the server
./start.sh
```

Alternatively, start them one at a time:

1. **Start Traefik:** Navigate to the `Traefik` directory and run `docker-compose up -d` in either the `insecure` or `ssl` folder. Traefik can either host insecure content or SSL content. If using the SSL Traefik docker-compose command, each service will receive its own SSL certificate provided by `LetsEncrypt` through `Traefik`. Traefik will take care of automatically renewing these certs as well. Navigate to either the `/insecure` or `/ssl` directory based on your needs.
1. **Start Each Service:** Start up each of your sites using `docker-compose up -d` in the directory of the site. Replicate the `site` folder structure as needed for other projects and update accordingly. Drop in your html/php files to each directory.

**Hosts:** You'll need to add each site url to your hosts file before it can be visited.

**If using the SSL Traefik config:** you'll need to edit the `traefik.toml` file in that directory. There is a line to add your email and default domain. These will be used to register each SSL cert. Without this information, it won't run.

There you go! You have a fully functioning multisite Docker server running the latest versions of Nginx and PHP, each with their own SSL certificate - all automated and virtualized. Easily transfer your entire server to another machine, scale your services quickly, or share your projects with others. 
