# calico-pod2daemon-flexvol

## Image Size

| Type | Size |
|------|------|
| Compressed | 140.53 MB |
| Uncompressed | ~351.33 MB |

## Usage

```bash
# Build the image
nix build .#calico-pod2daemon-flexvol

# Load into Docker
nix build .#load-calico-pod2daemon-flexvol-to-docker && ./result/bin/load-calico-pod2daemon-flexvol-to-docker
```
