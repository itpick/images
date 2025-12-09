{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-yet-another-cloudwatch-exporter
# Reference: https://images.chainguard.dev/directory/image/prometheus-yet-another-cloudwatch-exporter/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   yace (0.63.0-r3)

# TODO: Implement prometheus-yet-another-cloudwatch-exporter image
throw "Image 'prometheus-yet-another-cloudwatch-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-yet-another-cloudwatch-exporter";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-yet-another-cloudwatch-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
