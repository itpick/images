{ buildCLIImage, pkgs, lib, ... }:

# Image: redisinsight
# Reference: https://images.chainguard.dev/directory/image/redisinsight/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libsecret  # libsecret (0.21.7-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nodejs  # nodejs-25 (25.2.1-r0)
#   pkgs.redisinsight  # redisinsight (2.70.1-r5)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement redisinsight image
throw "Image 'redisinsight' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.redisinsight;
#   name = "redisinsight";
#   tag = "v${pkgs.redisinsight.version}";
#   entrypoint = [ "${pkgs.redisinsight}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "redisinsight";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
