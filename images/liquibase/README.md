# liquibase

Liquibase is a database schema change management solution that enables you to revise and release database changes faster and safer from development to production

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#liquibase

# Load into Docker
nix build .#load-liquibase-to-docker && ./result/bin/load-liquibase-to-docker
```
