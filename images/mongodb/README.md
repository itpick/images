# mongodb

MongoDB is a document-oriented database management system. MongoDB is a popular example of a NoSQL database, and stores data in JSON-like documents

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 90m 15s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#mongodb

# Load into Docker
nix build .#load-mongodb-to-docker && ./result/bin/load-mongodb-to-docker
```
