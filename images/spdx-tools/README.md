# spdx-tools

A command-line utility for creating, converting, comparing, and validating SPDX documents across multiple formats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spdx-tools

# Load into Docker
nix build .#load-spdx-tools-to-docker && ./result/bin/load-spdx-tools-to-docker
```
