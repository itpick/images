# .NET SDK

.NET SDK for building applications and services

## Description

The .NET SDK contains everything you need to build and run .NET applications. This container image provides .NET 8 SDK with enhanced security features including non-root execution and minimal attack surface. The SDK includes the .NET runtime, libraries, and tools for developing, building, running, and testing applications. It supports multiple programming languages including C#, F#, and VB.NET, and can target multiple platforms including web applications, desktop apps, mobile apps, games, IoT, and cloud services.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/dotnet:latest

# Create a new console application
docker run --rm \
  -v /host/projects:/home/nonroot/projects \
  -w /home/nonroot/projects \
  ghcr.io/nix-containers/images/dotnet:latest \
  dotnet new console -n MyApp

# Build and run an application
docker run --rm \
  -v /host/projects:/home/nonroot/projects \
  -w /home/nonroot/projects/MyApp \
  ghcr.io/nix-containers/images/dotnet:latest \
  dotnet run

# Restore dependencies and build
docker run --rm \
  -v /host/projects:/home/nonroot/projects \
  -w /home/nonroot/projects/MyApp \
  ghcr.io/nix-containers/images/dotnet:latest \
  sh -c "dotnet restore && dotnet build"
```

### Build Locally with Nix

```bash
# Build the image
nix build .#dotnet

# Load to Docker
nix run .#dotnet.copyTo -- docker-daemon:dotnet:latest

# Run tests
nix run .#dotnet-test
```

## What's Included

- .NET 8 SDK with all development tools
- C#, F#, and VB.NET language support
- NuGet package manager
- Git version control system
- Essential development utilities (findutils, which)
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- DOTNET_ROOT and DOTNET_CLI_HOME environment variables configured

## Upstream

- https://dotnet.microsoft.com/
- https://github.com/dotnet/core