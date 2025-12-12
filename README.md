# Nix Containers

A collection of container images built with nix2container, featuring dynamic discovery and multi-layer architecture.

## Build Times

*Generated: 2025-12-11 on x86_64-linux (NixOS)*

| Build Time | Images |
|-----------|--------|
| **>5 min** | vault (5m 11s) |
| **2-5 min** | nifi (2m 34s), cilium-agent (2m 19s), kyverno (2m 15s), cert-manager-acmesolver (2m 13s), crossplane (2m 11s), kyverno-cleanup-controller (2m 5s), kyverno-background-controller (2m 4s), apache-nifi (2m 2s), kyvernopre (2m 0s), kyverno-reports-controller (1m 52s), external-dns (1m 47s), spark (1m 44s), external-secrets (1m 38s), keda (1m 33s), istio-pilot (1m 32s), source-controller (1m 28s), cilium-operator-aws (1m 21s), kustomize-controller (1m 20s), ingress-nginx (1m 10s), notification-controller (1m 10s), cilium-operator (1m 8s), helm-controller (1m 5s), hubble-ui (1m 3s), nifi-registry (1m 2s), image-reflector-controller (1m 1s) |
| **30s-2 min** | kubeflow-trainer (59s), image-automation-controller (59s), spegel (56s), prometheus-config-reloader (54s), prometheus-adapter (52s), metrics-server (51s), cloudnative-pg (50s), hubble-relay (49s), spark-operator (46s), dragonfly-operator (43s), reloader (40s), ceph (39s), hubble-certgen (33s), static (33s) |
| **<30s** | 218 images build in under 30 seconds |

**Total: 327 images, 192m 27s total build time**

**Images requiring binary download (>5 min or complex builds):**
- `mongodb` - 90+ minutes to compile from source (C++ via scons)
- `envoy` - 14+ minutes to compile from source (C++ via Bazel)

## Architecture

- **Auto-build latest images** - Multiple patterns to build latest images securely (nix pipeline and github actions) 
- **Support building on Linux or MacOS (with lima)**
- **Pull and package latest upstream charts with the nix containers**
- **E2E image testing with the charts** - Testing with live cluster (kind)
- **CVE scanning** - Trivy/Grype
- **Multi-layer images** - Base packages in separate layers for better caching
- **Non-root users** - All images run as UID 1000 for security
- **Dynamic discovery** - Images automatically discovered from `images/` folder
- **Shared libraries and layers** - Common functionality in `lib/` folder
  - `base.nix` - Common packages, environment, and labels - optional layer
  - `nonRoot.nix` - A common Non-root user configuration - optional layer
  - `devShell.nix` - Development shell configurations with bash and dev tools
  - `buildCLIImage.nix` - CLI application wrapper
  - `mkUserEnvironment.nix` - User environment setup


## Container Image Ecosystem Comparison

<div align="center">

| Provider | <img src="https://nixos.org/favicon.ico" width="20" height="20"> Nix Containers | <img src="https://images.chainguard.dev/favicon.svg" width="20" height="20"> Chainguard | <img src="https://securebuild.com/favicon.ico" width="20" height="20"> Replicated SecureBuild |
|----------|:-----------:|:-----------:|:-----------:|
| **Public Images** | **54** | **51** | **31 (zero public)** |
| **Build System** | Nix + nix2container | apko + melange | Buildpacks |
| **Base** | NixOS/nixpkgs | Alpine/glibc | Various |
| **Security Focus** | Reproducible builds & minimal attack surface | Minimal attack surface | Supply chain security |
| **License** | Open Source | Open Source For Now | Commercial |

</div>

*Last updated: 2025-08-31*

---
## Available Images

*Updated: 2025-08-24*

### Content & Communication

- **hugo** - Fast and modern static site generator
- **maddy** - Modern mail server with SMTP, IMAP, and more

### Runtime Environments

- **cpp-runtime** - Minimal runtime for C++ and Rust binaries
- **bash** - GNU Bash shell environment
- **busybox** - Minimal Unix utilities in a single executable

### Nix Ecosystem

- **nix** - Nix package manager and build system
- **nix-flakes** - Nix with flakes experimental feature enabled
- **nix-unstable** - Nix unstable version with latest features
- **nix-unstable-static** - Statically linked Nix unstable version
- **attic** - Multi-tenant Nix binary cache client
- **cachix** - Binary cache service for Nix packages
- **cachix-flakes** - Binary cache service with Nix flakes support

### Kubernetes & DevOps

- **kubectl** - Kubernetes command-line tool
- **kubernetes-helm** - Package manager for Kubernetes
- **helm** - Kubernetes package manager (standalone)
- **ko** - Build and deploy Go applications on Kubernetes
- **dragonfly-operator** - Kubernetes operator for Dragonfly instances
- **external-dns** - External DNS controller for Kubernetes
- **docker-compose** - Tool for defining multi-container Docker applications
- **crane** - Tool for interacting with remote images and registries
- **dive** - Tool for exploring docker image layers and reducing size

### Development Tools

- **cpp-build-env** - Complete C++ development environment with GCC, CMake, GTest
- **rust-build-env** - Complete Rust development environment with Cargo, Clippy, rust-analyzer
- **devcontainer** - Development container with common tools
- **devenv** - Fast, declarative, reproducible development environments
- **git** - Git version control system with SSH and GPG support
- **go** - Go programming language with development tools
- **python** - Python programming language with pip and development tools
- **node** - Node.js JavaScript runtime with npm and yarn
- **rust** - Rust programming language with Cargo toolchain
- **jdk** - OpenJDK Java Development Kit
- **jre** - OpenJDK Java Runtime Environment
- **gradle** - Gradle build automation tool for Java
- **maven** - Apache Maven build automation tool for Java
- **php** - PHP programming language with Composer
- **ruby** - Ruby programming language with Bundler
- **dotnet** - .NET SDK for building applications
- **aspnet-runtime** - ASP.NET Core runtime environment

### Security & Auth

- **sops** - SOPS encryption tool with GPG support
- **pocket-id** - Personal identity provider for OAuth2/OIDC
- **cosign** - Container signing tool with support for OCI registry
- **grype** - Vulnerability scanner for container images and filesystems

### Databases & Data Stores

- **postgres** - PostgreSQL relational database
- **redis** - Redis key-value store
- **mongodb** - MongoDB document database
- **mariadb** - MariaDB relational database
- **valkey** - High-performance data structure server (Redis fork)

### Web Servers & Networking

- **nginx** - High-performance HTTP server and reverse proxy
- **caddy** - Modern HTTP/2 web server with automatic HTTPS
- **haproxy** - High-performance TCP/HTTP load balancer
- **curl** - Command line tool for transferring data with URLs

### Base Images & Utilities

- **static** - Statically linked base image with essential tools
- **glibc-dynamic** - Dynamically linked glibc base image
- **wait-for-it** - Wait for service dependencies before starting

### Quick Build Commands

```bash
# Build and load specific images
nix build .#load-<image-name>-to-docker

# Examples:
nix build .#load-nginx-to-docker        # Web server
nix build .#load-cpp-build-env-to-docker  # C++ development
nix build .#load-rust-build-env-to-docker # Rust development
nix build .#load-kubectl-to-docker        # Kubernetes CLI

# Build and load all images at once
nix build .#load-all-to-docker && ./result/bin/load-all-to-docker
```

---
## Local Development

### Quick Start (Makefile "Training Wheels")

The Makefile provides convenient shortcuts for common tasks - especially useful if you're new to Nix:

```bash
# See all available commands
make help

# Test everything
make verify                    # Run 3 verification tests
make test-all                 # Build and test all images
make list-images              # List available images

# Test specific images
make test-image IMAGE=bash    # Test single image
make test-bash                # Quick test for bash image

# GitHub Actions testing
make test-workflows           # Test workflows with act (dry run)
make install-act              # Install act tool automatically
```

### Pure Nix Commands (Advanced)

If you prefer using Nix directly without the Makefile abstraction:

```bash
# Discovery using lib.filesystem.listFilesRecursive
nix eval --json .#discoveredImages

# Build and load specific images
nix build .#load-<image-name>-to-docker
# Example:
nix build .#load-sops-to-docker

# Build and load all images at once
nix build .#load-all-to-docker && ./result/bin/load-all-to-docker

# Run comprehensive test suite
nix run .#test-all-images

# Image discovery script
nix run .#discover-images
```

### Why Both Makefile and Nix?

The **Makefile serves as "training wheels"** for developers:
- **Familiar interface**: `make test` is more intuitive than complex Nix commands
- **Documentation**: `make help` shows available tasks without knowing Nix
- **Tool management**: Automatically installs `act` and handles dependencies
- **IDE integration**: Most editors understand Makefiles for task running
- **Onboarding**: New contributors can be productive without learning Nix first

The **Nix commands are the "real" implementation**:
- More powerful and flexible
- Direct access to all flake outputs
- Better integration with Nix ecosystem
- Required for advanced workflows

### Verify Images in Docker

```bash
# List loaded images
docker images | grep -E "(cpp-runtime|cpp-build-env|rust-build-env|kubectl|dragonfly-operator|external-dns|sops-base)"
```

## Registry Management

### Tag and Push to Different Registry

After building images locally, you can retag and push them to your own registry:

```bash
# Tag and push cpp-runtime
docker tag cpp-runtime your-registry.com/cpp-runtime:latest
docker push your-registry.com/cpp-runtime:latest

# Tag and push cpp-build-env
docker tag cpp-build-env your-registry.com/cpp-build-env:latest
docker push your-registry.com/cpp-build-env:latest

# Tag and push rust-build-env
docker tag rust-build-env your-registry.com/rust-build-env:latest
docker push your-registry.com/rust-build-env:latest

# Tag and push kubectl
docker tag kubectl your-registry.com/kubectl:latest
docker push your-registry.com/kubectl:latest

# Tag and push dragonfly-operator
docker tag dragonfly-operator your-registry.com/dragonfly-operator:latest
docker push your-registry.com/dragonfly-operator:latest

# Tag and push external-dns
docker tag external-dns your-registry.com/external-dns:latest
docker push your-registry.com/external-dns:latest

# Tag and push sops-base
docker tag sops-base your-registry.com/sops-base:latest
docker push your-registry.com/sops-base:latest
```

### Bulk Push Script

```bash
#!/bin/bash
REGISTRY="your-registry.com"
IMAGES_RAW=($(find images -name "default.nix" -exec dirname {} \; | sort | xargs -I {} basename {}))

for image in "${IMAGES[@]}"; do
    echo "= Pushing $image..."
    docker tag "$image" "$REGISTRY/$image:latest"
    docker push "$REGISTRY/$image:latest"
    echo " $image pushed successfully!"
done
```

## Checking for Package Updates

Use `nvchecker` to check for upstream version updates:

```bash
# Check for updates to custom packages in pkgs/
nix-shell -p nvchecker --run "nvchecker -c nvchecker.toml && nvcmp -c nvchecker.toml"
```

This compares versions in `old_versions.json` against the latest GitHub releases for packages like cilium, cert-manager, cloudnative-pg, keda, etc.

## Development Environment

```bash
# Enter development shell with all tools
nix develop
```

The development shell includes:
- **nix** - Nix package manager and build tools
- **docker** & **docker-compose** - Container runtime and orchestration
- **act** - Run GitHub Actions locally for pipeline testing
- **jq** - JSON processing for workflow debugging
- **git** & **gh** - Version control and GitHub CLI
- **just** & **gnumake** - Build automation tools

### Testing GitHub Actions Locally

```bash
# List available workflows
act -l

# Test the build workflow locally
act -j build-containers

# Force x86_64 architecture (if needed on ARM systems)
act --container-architecture linux/amd64
```

### Using Development Shell Library

The `lib/devShell.nix` library provides reusable development shell configurations:

```nix
# In your image's default.nix
{ pkgs, ... }:
let
  devShell = pkgs.callPackage ../lib/devShell.nix {};
in {
  # Use predefined shells
  packages = devShell.minimalDevShell.packages;     # bash + basic tools
  packages = devShell.standardDevShell.packages;    # + extended utilities  
  packages = devShell.fullDevShell.packages;        # + programming & container tools
  
  # Create custom shell
  packages = (devShell.mkDevShell {
    extraPackages = [ pkgs.htop pkgs.tmux ];
    includeBasic = true;
    includeExtended = true;
    includeProgramming = false;
  }).packages;
}
```

TODO
Simplify root readme with maximum valuable info
Add more chart tests
Add full chart tests instead of image chart tests that are triggered by the main image of a chart set of images.
Finish all to-do packages
Finish all to-do images
Cleanup old scripts
Document image updates
Document time to every build of every image
Add way to develop list of input images from a config file - and add a bigbang image input as example
still need to add full trivy/grype results