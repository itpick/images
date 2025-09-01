# Ruby

A dynamic, open source programming language with a focus on simplicity and productivity

## Description

Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. This container image provides Ruby 3.3 with Bundler for dependency management and essential development tools. The image includes enhanced security features with non-root execution and minimal attack surface. Ruby has an elegant syntax that is natural to read and easy to write, making it perfect for web development, scripting, data processing, and automation tasks.

## Quick Start

### Pull and Run

```bash
# Pull the image
docker pull ghcr.io/nix-containers/images/ruby:latest

# Run Ruby interactively
docker run -it --rm ghcr.io/nix-containers/images/ruby:latest ruby

# Execute a Ruby script
docker run --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/ruby:latest \
  ruby script.rb

# Install gems with Bundler
docker run --rm \
  -v /host/app:/home/nonroot/app \
  -w /home/nonroot/app \
  ghcr.io/nix-containers/images/ruby:latest \
  bundle install
```

### Build Locally with Nix

```bash
# Build the image
nix build .#ruby

# Load to Docker
nix run .#ruby.copyTo -- docker-daemon:ruby:latest

# Run tests
nix run .#ruby-test
```

## What's Included

- Ruby 3.3 programming language
- Bundler dependency manager
- Git version control system
- Build tools (gcc, make) for native extensions
- Essential development utilities (findutils, which)
- Essential system utilities (bash, coreutils)
- Non-root user execution for enhanced security
- GEM_HOME and BUNDLE_PATH configured

## Upstream

- https://www.ruby-lang.org/
- https://bundler.io/