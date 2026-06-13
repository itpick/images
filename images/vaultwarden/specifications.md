# Specifications: vaultwarden

- **Base:** nix2container (nixpkgs `pkgs.vaultwarden`)
- **Build strategy:** nixpkgs Rust package (pre-built in nixpkgs)
- **Entrypoint:** `/bin/vaultwarden`
- **User:** 65534:65534 (nobody, non-root)
- **Ports:** 80 (HTTP), 3012 (WebSocket)
- **Persistent dirs:** `/data`
- **Required env:** `DOMAIN` (optional: `ADMIN_TOKEN`)
- **Version tracked:** via `pkgs.vaultwarden.version` in nixpkgs
