{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-mysqld-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-mysqld-exporter/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.prometheus-mysqld-exporter  # prometheus-mysqld-exporter (0.18.0-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement prometheus-mysqld-exporter image
throw "Image 'prometheus-mysqld-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prometheus-mysqld-exporter;
#   name = "prometheus-mysqld-exporter";
#   tag = "v${pkgs.prometheus-mysqld-exporter.version}";
#   entrypoint = [ "${pkgs.prometheus-mysqld-exporter}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-mysqld-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
