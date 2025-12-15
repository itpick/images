# seata-server

Seata is a high-performance, easy-to-use distributed transaction solution designed for microservices architecture

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#seata-server

# Load into Docker
nix build .#load-seata-server-to-docker && ./result/bin/load-seata-server-to-docker
```
