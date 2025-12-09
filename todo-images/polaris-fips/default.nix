{ buildCLIImage, pkgs, lib, ... }:

# Image: polaris-fips
# Reference: https://images.chainguard.dev/directory/image/polaris-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   polaris-fips (10.1.2-r1)

# TODO: Implement polaris-fips image
throw "Image 'polaris-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "polaris-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1200";
#
#   labels = {
#     "org.opencontainers.image.title" = "polaris-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
