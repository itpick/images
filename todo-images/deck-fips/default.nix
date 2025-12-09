{ buildCLIImage, pkgs, lib, ... }:

# Image: deck-fips
# Reference: https://images.chainguard.dev/directory/image/deck-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   deck-fips (1.54.0-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement deck-fips image
throw "Image 'deck-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "deck-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "deck-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
