# PHP

A popular general-purpose scripting language for web development

## Description

PHP is a popular general-purpose scripting language that is especially suited to web development. This container image provides PHP 8.3 runtime with Composer dependency manager and essential development tools. The image includes enhanced security features including non-root execution and minimal attack surface, making it suitable for both development and production environments. It includes Git for dependency management and various utilities for PHP application deployment.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/php:latest

# Run PHP interactively
docker run -it --rm ghcr.io/nix-containers/images/php:latest php -a

# Execute a PHP script
docker run --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/php:latest \
  php script.php

# Install dependencies with Composer
docker run --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/php:latest \
  composer install --no-dev --optimize-autoloader
```

### Build Locally with Nix

```bash
# Build the image
nix build .#php

# Load to Docker
nix run .#php.copyTo -- docker-daemon:php:latest

# Run tests
nix run .#php-test
```

## What's Included

- PHP 8.3 runtime with common extensions
- Composer dependency manager
- Git version control system
- Essential development utilities (findutils, which)
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- Composer home directory at /home/nonroot/.composer

## Upstream

- https://www.php.net/
- https://getcomposer.org/