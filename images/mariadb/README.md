# MariaDB

A secure, high-performance relational database server based on MySQL

## Description

MariaDB is a popular open source relational database that was created as a fork of MySQL. This container image provides a complete MariaDB server installation with enhanced security features including non-root execution, minimal attack surface, and comprehensive logging. The image is built from source using Nix for reproducible builds and includes essential database administration tools for managing your MariaDB instances.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/mariadb:latest

# Run with basic configuration
docker run -d --name mariadb \
  -e MYSQL_ROOT_PASSWORD=mypassword \
  -p 3306:3306 \
  ghcr.io/nix-containers/images/mariadb:latest

# Run with custom data directory
docker run -d --name mariadb \
  -e MYSQL_ROOT_PASSWORD=mypassword \
  -v /host/data:/home/nonroot/data \
  -p 3306:3306 \
  ghcr.io/nix-containers/images/mariadb:latest

# Connect to the database
docker run -it --rm --link mariadb:mysql \
  ghcr.io/nix-containers/images/mariadb:latest \
  mysql -h mysql -u root -p
```

### Build Locally with Nix

```bash
# Build the image
nix build .#mariadb

# Load to Docker
nix run .#mariadb.copyTo -- docker-daemon:mariadb:latest

# Run tests
nix run .#mariadb-test
```

## What's Included

- MariaDB database server
- MySQL client tools (mysql, mysqldump, mysqladmin)
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- Standard port 3306 exposed
- Data directory at /home/nonroot/data

## Upstream

- https://mariadb.org/
- https://github.com/MariaDB/server