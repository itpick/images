# chart-testing-fips

Tool for testing Helm charts, used for linting and testing pull requests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chart-testing-fips

# Load into Docker
nix build .#load-chart-testing-fips-to-docker && ./result/bin/load-chart-testing-fips-to-docker
```
