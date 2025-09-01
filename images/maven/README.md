# Maven

A container image with Apache Maven build automation and dependency management tool.

## Description

This image provides Apache Maven with OpenJDK 21 and development utilities. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for building Java projects, managing dependencies, and running in CI/CD pipelines or development environments.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/maven:latest

# Check Maven version
docker run --rm ghcr.io/nix-containers/images/maven:latest mvn --version

# Build a Maven project
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/maven:latest mvn clean compile

# Run tests with Maven
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/maven:latest mvn test

# Package application
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/maven:latest mvn clean package
```

### Build Locally with Nix

```bash
# Build the image
nix build .#maven

# Load to Docker
nix run .#maven.copyTo -- docker-daemon:maven:latest

# Run tests
nix run .#maven-test
```

## What's Included

- Apache Maven - build automation and dependency management
- OpenJDK 21 - Java Development Kit
- Git for version control
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Pre-configured JAVA_HOME and MAVEN_CONFIG
- Build and development tools

## Upstream

- **Apache Maven**: https://maven.apache.org/
- **OpenJDK**: https://openjdk.java.net/