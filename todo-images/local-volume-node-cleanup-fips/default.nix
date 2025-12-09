{ buildCLIImage, pkgs, lib, ... }:

# Image: local-volume-node-cleanup-fips
# Reference: https://images.chainguard.dev/directory/image/local-volume-node-cleanup-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   local-volume-node-cleanup-fips (2.8.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement local-volume-node-cleanup-fips image
throw "Image 'local-volume-node-cleanup-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "local-volume-node-cleanup-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "local-volume-node-cleanup-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
