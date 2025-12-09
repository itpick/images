{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-process-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-process-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-process-exporter-fips (0.8.7-r5)

# TODO: Implement prometheus-process-exporter-fips image
throw "Image 'prometheus-process-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-process-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-process-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
