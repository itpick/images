# gitlab-shell

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gitlab-shell

# Load into Docker
nix build .#load-gitlab-shell-to-docker && ./result/bin/load-gitlab-shell-to-docker
```
