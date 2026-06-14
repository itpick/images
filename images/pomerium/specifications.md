# Specifications: pomerium

- **Base:** scratch (nixpkgs `pkgs.pomerium`, nixpkgs-wrapped)
- **Build strategy:** nixpkgs Go package (pre-built in nixpkgs)
- **Entrypoint:** `${pkgs.pomerium}/bin/pomerium`
- **User:** 1000:1000 (non-root)
- **Ports:** 443 (HTTPS proxy)
- **Persistent dirs:** none required (stateless by default; external databroker optional)
- **Required env:** `IDP_CLIENT_ID`, `IDP_CLIENT_SECRET`, `COOKIE_SECRET`, policy config
- **Version tracked:** via `pkgs.pomerium.version` in nixpkgs (0.32.7)
