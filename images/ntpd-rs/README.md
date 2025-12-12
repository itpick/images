# ntpd-rs

## Image Size

| Type | Size |
|------|------|
| Compressed | 122.62 MB |
| Uncompressed | ~306.57 MB |

## Usage

```bash
# Build the image
nix build .#ntpd-rs

# Load into Docker
nix build .#load-ntpd-rs-to-docker && ./result/bin/load-ntpd-rs-to-docker
```
