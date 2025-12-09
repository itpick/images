{ buildCLIImage, pkgs, lib, ... }:

# Image: rclone-fips
# Reference: https://images.chainguard.dev/directory/image/rclone-fips/overview

# Packages available in nixpkgs:
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fuse3-libs (3.17.4-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   rclone-fips (1.72.0-r1)

# TODO: Implement rclone-fips image
throw "Image 'rclone-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.fuse3;
#   name = "rclone-fips";
#   tag = "v${pkgs.fuse3.version}";
#   entrypoint = [ "${pkgs.fuse3}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "rclone-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
