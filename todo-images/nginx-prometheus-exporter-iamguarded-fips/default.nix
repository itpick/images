{ buildCLIImage, pkgs, lib, ... }:

# Image: nginx-prometheus-exporter-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/nginx-prometheus-exporter-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   nginx-prometheus-exporter-fips (1.5.1-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement nginx-prometheus-exporter-iamguarded-fips image
throw "Image 'nginx-prometheus-exporter-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "nginx-prometheus-exporter-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "nginx-prometheus-exporter-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
