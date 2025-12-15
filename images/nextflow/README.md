# nextflow

Nextflow is a domain-specific language (DSL) for data-driven computational pipelines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nextflow

# Load into Docker
nix build .#load-nextflow-to-docker && ./result/bin/load-nextflow-to-docker
```
