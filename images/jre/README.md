# JRE (Java Runtime Environment)

A minimal container image with OpenJDK Java Runtime Environment for running Java applications.

## Description

This image provides OpenJDK 21 headless runtime for running Java applications without GUI components. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for running Java applications in production environments or containers.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/jre:latest

# Check Java version
docker run --rm ghcr.io/nix-containers/images/jre:latest java -version

# Run a Java JAR application
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/jre:latest java -jar application.jar

# Run with JVM options
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/jre:latest java -Xmx512m -jar application.jar
```

### Build Locally with Nix

```bash
# Build the image
nix build .#jre

# Load to Docker
nix run .#jre.copyTo -- docker-daemon:jre:latest

# Run tests
nix run .#jre-test
```

## What's Included

- OpenJDK 21 (headless) - Java Runtime Environment
- java command for running Java applications
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Pre-configured JAVA_HOME environment variable
- Minimal runtime without development tools

## Upstream

- **OpenJDK**: https://openjdk.java.net/