{ buildCLIImage, pkgs, lib, ... }:

# Image: rclone
# Reference: https://images.chainguard.dev/directory/image/rclone/overview

# Packages available in nixpkgs:
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.rclone  # rclone (1.72.0-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fuse3-libs (3.17.4-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)

# TODO: Implement rclone image
throw "Image 'rclone' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.rclone;
#   name = "rclone";
#   tag = "v${pkgs.rclone.version}";
#   entrypoint = [ "${pkgs.rclone}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "rclone";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
