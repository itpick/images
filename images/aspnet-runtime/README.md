# ASP.NET Core Runtime

ASP.NET Core runtime for web applications and services

## Description

The ASP.NET Core Runtime provides everything needed to run ASP.NET Core web applications and services. This container image provides .NET 8 runtime with enhanced security features including non-root execution and minimal attack surface. The runtime is optimized for web applications and includes libraries and components needed for high-performance web APIs, web applications, and microservices. It's designed for production deployments where you want minimal image size and attack surface.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/aspnet-runtime:latest

# Run a pre-built ASP.NET Core application
docker run -d --name webapp \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  -p 8080:8080 \
  ghcr.io/nix-containers/images/aspnet-runtime:latest \
  dotnet MyWebApp.dll

# Run with custom environment
docker run -d --name webapp \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  -p 8080:8080 \
  -e ASPNETCORE_ENVIRONMENT=Production \
  -e ASPNETCORE_URLS=http://+:8080 \
  ghcr.io/nix-containers/images/aspnet-runtime:latest \
  dotnet MyWebApp.dll

# Health check example
docker run --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/aspnet-runtime:latest \
  dotnet --info
```

### Build Locally with Nix

```bash
# Build the image
nix build .#aspnet-runtime

# Load to Docker
nix run .#aspnet-runtime.copyTo -- docker-daemon:aspnet-runtime:latest

# Run tests
nix run .#aspnet-runtime-test
```

## What's Included

- .NET 8 ASP.NET Core Runtime
- High-performance web application support
- Minimal runtime optimized for production
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- Port 8080 exposed for web applications
- DOTNET_ROOT environment variable configured

## Upstream

- https://dotnet.microsoft.com/
- https://github.com/dotnet/aspnetcore