# gitlab-container-registry

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 325.14 MB |
| Uncompressed | ~812.85 MB |

## Usage

```bash
# Build the image
nix build .#gitlab-container-registry

# Load into Docker
nix build .#load-gitlab-container-registry-to-docker && ./result/bin/load-gitlab-container-registry-to-docker
```
