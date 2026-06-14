# Specifications: pyroscope

- **Base:** scratch (nixpkgs `pkgs.pyroscope`, nixpkgs-wrapped)
- **Build strategy:** nixpkgs Go package (pre-built in nixpkgs)
- **Entrypoint:** `${pkgs.pyroscope}/bin/pyroscope`
- **User:** 1000:1000 (non-root)
- **Ports:** 4040 (HTTP API + UI)
- **Persistent dirs:** `/var/lib/pyroscope` (profile data; configure via `storage.path`)
- **Required env:** config file at `/etc/pyroscope/config.yaml` or via env vars
- **Version tracked:** via `pkgs.pyroscope.version` in nixpkgs (1.20.3)
