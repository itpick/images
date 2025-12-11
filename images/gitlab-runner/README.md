# gitlab-runner

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gitlab-runner

# Load into Docker
nix build .#load-gitlab-runner-to-docker && ./result/bin/load-gitlab-runner-to-docker
```
