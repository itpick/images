# nextflow-fips

Nextflow is a domain-specific language (DSL) for data-driven computational pipelines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nextflow-fips

# Load into Docker
nix build .#load-nextflow-fips-to-docker && ./result/bin/load-nextflow-fips-to-docker
```
