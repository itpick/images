# rails

Ruby on Rails (often just called "Rails") is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rails

# Load into Docker
nix build .#load-rails-to-docker && ./result/bin/load-rails-to-docker
```
