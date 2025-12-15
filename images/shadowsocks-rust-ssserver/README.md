# shadowsocks-rust-ssserver

Shadowsocks-rust is a Rust implementation of the Shadowsocks protocol, aimed at ensuring secure and private internet access by encrypting connections and circumventing internet restrictions

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#shadowsocks-rust-ssserver

# Load into Docker
nix build .#load-shadowsocks-rust-ssserver-to-docker && ./result/bin/load-shadowsocks-rust-ssserver-to-docker
```
