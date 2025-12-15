# wso2is

WSO2 Identity Server is a powerful, modern identity and access management solution for your on-premises or cloud environment

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wso2is

# Load into Docker
nix build .#load-wso2is-to-docker && ./result/bin/load-wso2is-to-docker
```
