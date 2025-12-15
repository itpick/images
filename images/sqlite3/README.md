# sqlite3

SQLite is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sqlite3

# Load into Docker
nix build .#load-sqlite3-to-docker && ./result/bin/load-sqlite3-to-docker
```
