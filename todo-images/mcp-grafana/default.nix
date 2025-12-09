{ buildCLIImage, pkgs, lib, ... }:

# Image: mcp-grafana
# Reference: https://images.chainguard.dev/directory/image/mcp-grafana/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.mcp-grafana  # mcp-grafana (0.7.10-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)

# TODO: Implement mcp-grafana image
throw "Image 'mcp-grafana' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.mcp-grafana;
#   name = "mcp-grafana";
#   tag = "v${pkgs.mcp-grafana.version}";
#   entrypoint = [ "${pkgs.mcp-grafana}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "mcp-grafana";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
