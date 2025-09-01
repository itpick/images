# JDK (Java Development Kit)

A container image with OpenJDK Java Development Kit for developing Java applications.

## Description

This image provides OpenJDK 21 with development tools, Git, and build utilities. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for compiling and developing Java applications, CI/CD pipelines, or development environments.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/jdk:latest

# Check Java version
docker run --rm ghcr.io/nix-containers/images/jdk:latest java -version

# Compile a Java program
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/jdk:latest javac HelloWorld.java

# Run a Java program
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/jdk:latest java HelloWorld
```

### Build Locally with Nix

```bash
# Build the image
nix build .#jdk

# Load to Docker
nix run .#jdk.copyTo -- docker-daemon:jdk:latest

# Run tests
nix run .#jdk-test
```

## What's Included

- OpenJDK 21 - Java Development Kit
- javac, java, jar, and other JDK tools
- Git for version control
- Build tools (make)
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Pre-configured JAVA_HOME environment variable

## Upstream

- **OpenJDK**: https://openjdk.java.net/