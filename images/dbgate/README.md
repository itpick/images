# dbgate

DbGate is a database administration tool for SQL Server, MySQL, PostgreSQL, MongoDB, Redis and SQLite. DbGate provides a modern web interface for database management, query execution, and data visualization

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dbgate

# Load into Docker
nix build .#load-dbgate-to-docker && ./result/bin/load-dbgate-to-docker
```
