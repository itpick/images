{ buildCLIImage, pkgs, lib, ... }:

# Image: trillian-logsigner-fips
# Reference: https://images.chainguard.dev/directory/image/trillian-logsigner-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   trillian-fips-logsigner (1.7.2-r6)

# TODO: Implement trillian-logsigner-fips image
throw "Image 'trillian-logsigner-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "trillian-logsigner-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "trillian-logsigner-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
