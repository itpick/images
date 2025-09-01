# Hugo

Fast and flexible static site generator built with Go

## Description

Hugo is a fast and flexible static site generator built with Go. This container image provides a complete Hugo installation with enhanced security features including non-root execution and minimal attack surface. Hugo makes it fun to create and maintain websites, with features like extremely fast build times, powerful content management, powerful theming system, and support for multiple content formats. It's perfect for blogs, documentation sites, portfolios, and company websites.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/hugo:latest

# Create a new Hugo site
docker run --rm \
  -v /host/sites:/home/nonroot/sites \
  -w /home/nonroot/sites \
  ghcr.io/nix-containers/images/hugo:latest \
  hugo new site mysite

# Build a Hugo site
docker run --rm \
  -v /host/mysite:/home/nonroot/site \
  -w /home/nonroot/site \
  ghcr.io/nix-containers/images/hugo:latest \
  hugo

# Serve site locally for development
docker run --rm \
  -v /host/mysite:/home/nonroot/site \
  -w /home/nonroot/site \
  -p 1313:1313 \
  ghcr.io/nix-containers/images/hugo:latest \
  hugo server --bind 0.0.0.0
```

### Build Locally with Nix

```bash
# Build the image
nix build .#hugo

# Load to Docker
nix run .#hugo.copyTo -- docker-daemon:hugo:latest

# Run tests
nix run .#hugo-test
```

## What's Included

- Hugo static site generator
- Fast build times and live reload
- Support for multiple content formats
- Powerful theming system
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security

## Upstream

- https://gohugo.io/
- https://github.com/gohugoio/hugo