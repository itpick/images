# semgrep

CLI for the Semgrep static analysis tool. Semgrep is a lightweight static analysis tool for many languages. It finds bug variants with patterns that look like source code

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#semgrep

# Load into Docker
nix build .#load-semgrep-to-docker && ./result/bin/load-semgrep-to-docker
```
