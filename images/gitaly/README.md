# gitaly

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#gitaly

# Load into Docker
nix build .#load-gitaly-to-docker && ./result/bin/load-gitaly-to-docker
```
