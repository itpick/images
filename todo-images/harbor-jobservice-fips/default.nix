{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-jobservice-fips
# Reference: https://images.chainguard.dev/directory/image/harbor-jobservice-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   harbor-fips-2.14-jobservice (2.14.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement harbor-jobservice-fips image
throw "Image 'harbor-jobservice-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-jobservice-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-jobservice-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
