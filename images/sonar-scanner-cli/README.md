# sonar-scanner-cli

Scanner CLI for SonarQube and SonarCloud

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sonar-scanner-cli

# Load into Docker
nix build .#load-sonar-scanner-cli-to-docker && ./result/bin/load-sonar-scanner-cli-to-docker
```
