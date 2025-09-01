# MongoDB

A container image with MongoDB document database.

## Description

This image provides MongoDB, a popular NoSQL document database. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for development, testing, or production database workloads requiring flexible document storage.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/mongodb:latest

# Run MongoDB server
docker run -d --name mongodb -p 27017:27017 ghcr.io/nix-containers/images/mongodb:latest mongod --bind_ip_all

# Connect to MongoDB shell
docker exec -it mongodb mongo

# Run with persistent storage
docker run -d --name mongodb \
  -p 27017:27017 \
  -v mongodb_data:/data/db \
  ghcr.io/nix-containers/images/mongodb:latest mongod --bind_ip_all
```

### Build Locally with Nix

```bash
# Build the image
nix build .#mongodb

# Load to Docker
nix run .#mongodb.copyTo -- docker-daemon:mongodb:latest

# Run tests
nix run .#mongodb-test
```

## What's Included

- MongoDB - document database
- MongoDB shell (mongo) - interactive JavaScript interface
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Exposed port 27017

## Upstream

- **MongoDB**: https://www.mongodb.com/