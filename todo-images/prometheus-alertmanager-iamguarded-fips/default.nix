{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-alertmanager-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-alertmanager-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-alertmanager-fips (0.29.0-r2)

# TODO: Implement prometheus-alertmanager-iamguarded-fips image
throw "Image 'prometheus-alertmanager-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-alertmanager-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-alertmanager-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
