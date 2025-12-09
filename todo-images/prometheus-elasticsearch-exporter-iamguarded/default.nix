{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-elasticsearch-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/prometheus-elasticsearch-exporter-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.prometheus-elasticsearch-exporter  # prometheus-elasticsearch-exporter (1.9.0-r49)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement prometheus-elasticsearch-exporter-iamguarded image
throw "Image 'prometheus-elasticsearch-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-elasticsearch-exporter-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-elasticsearch-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
