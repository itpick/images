# awx

Chainguard image for AWX. Built on top of Ansible, AWX is an automation controller that provides a web based interface, REST API, and task engine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#awx

# Load into Docker
nix build .#load-awx-to-docker && ./result/bin/load-awx-to-docker
```
