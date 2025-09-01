# Gradle

A container image with Gradle build automation tool for Java and other JVM languages.

## Description

This image provides Gradle build automation tool with OpenJDK 21 and development utilities. Built on a non-root user setup (UID 1000) for enhanced security. Perfect for building Java, Kotlin, Scala, and other JVM-based projects in CI/CD pipelines or development environments.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/gradle:latest

# Check Gradle version
docker run --rm ghcr.io/nix-containers/images/gradle:latest gradle --version

# Build a Gradle project
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/gradle:latest gradle build

# Run tests with Gradle
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/nix-containers/images/gradle:latest gradle test
```

### Build Locally with Nix

```bash
# Build the image
nix build .#gradle

# Load to Docker
nix run .#gradle.copyTo -- docker-daemon:gradle:latest

# Run tests
nix run .#gradle-test
```

## What's Included

- Gradle - build automation tool
- OpenJDK 21 - Java Development Kit
- Git for version control
- Bash shell and core utilities
- Non-root user environment (UID 1000)
- Pre-configured JAVA_HOME and GRADLE_USER_HOME
- Build and development tools

## Upstream

- **Gradle**: https://gradle.org/
- **OpenJDK**: https://openjdk.java.net/