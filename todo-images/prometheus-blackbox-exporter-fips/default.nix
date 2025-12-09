{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-blackbox-exporter-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-blackbox-exporter-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-blackbox-exporter-fips (0.28.0-r0)

# TODO: Implement prometheus-blackbox-exporter-fips image
throw "Image 'prometheus-blackbox-exporter-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-blackbox-exporter-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-blackbox-exporter-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
