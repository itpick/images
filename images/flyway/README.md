# flyway

Flyway is a database migration tool to evolve your database schema easily and reliably across all your instances

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flyway

# Load into Docker
nix build .#load-flyway-to-docker && ./result/bin/load-flyway-to-docker
```
