# chart-testing

Tool for testing Helm charts, used for linting and testing pull requests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#chart-testing

# Load into Docker
nix build .#load-chart-testing-to-docker && ./result/bin/load-chart-testing-to-docker
```
