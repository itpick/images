{ buildCLIImage, pkgs, lib, ... }:

# Image: chainguard-base-fips
# Reference: https://images.chainguard.dev/directory/image/chainguard-base-fips/overview

# Packages available in nixpkgs:
#   pkgs.apk-tools  # apk-tools (2.14.10-r9)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   wolfi-base (1-r7)
#   wolfi-keys (1-r12)

# TODO: Implement chainguard-base-fips image
throw "Image 'chainguard-base-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.apk-tools;
#   name = "chainguard-base-fips";
#   tag = "v${pkgs.apk-tools.version}";
#   entrypoint = [ "${pkgs.apk-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "chainguard-base-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
