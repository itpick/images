# apache-kvrocks

Apache Kvrocks is a distributed key-value database. Apache Kvrocks uses RocksDB as its storage engine and is compatible with Redis protocol

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#apache-kvrocks

# Load into Docker
nix build .#load-apache-kvrocks-to-docker && ./result/bin/load-apache-kvrocks-to-docker
```
