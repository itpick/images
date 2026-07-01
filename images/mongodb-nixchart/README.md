# mongodb-nixchart

MongoDB is a document-oriented database management system. MongoDB is a popular example of a NoSQL database, and stores data in JSON-like documents

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongodb-nixchart

# Load into Docker
nix build .#load-mongodb-nixchart-to-docker && ./result/bin/load-mongodb-nixchart-to-docker
```
