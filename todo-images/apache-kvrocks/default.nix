{ buildCLIImage, pkgs, lib, ... }:

# Image: apache-kvrocks
# Reference: https://images.chainguard.dev/directory/image/apache-kvrocks/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   apache-kvrocks (2.14.0-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   redis-cli-8.4 (8.4.0-r0)

# TODO: Implement apache-kvrocks image
throw "Image 'apache-kvrocks' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "apache-kvrocks";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "apache-kvrocks";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
