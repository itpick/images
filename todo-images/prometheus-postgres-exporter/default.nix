{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-postgres-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-postgres-exporter/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.prometheus-postgres-exporter  # prometheus-postgres-exporter (0.18.1-r5)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement prometheus-postgres-exporter image
throw "Image 'prometheus-postgres-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-postgres-exporter;
#   name = "prometheus-postgres-exporter";
#   tag = "v${pkgs.prometheus-postgres-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-postgres-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
