{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-prometheus-exporter-iamguarded
# Reference: https://images.chainguard.dev/directory/image/nginx-prometheus-exporter-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   nginx-prometheus-exporter (1.5.1-r2)

# TODO: Implement nginx-prometheus-exporter-iamguarded image
throw "Image 'nginx-prometheus-exporter-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "nginx-prometheus-exporter-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-prometheus-exporter-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
