{ buildCLIImage, pkgs, lib, ... }:

# Image: mountpoint-s3-csi-driver
# Reference: https://images.chainguard.dev/directory/image/mountpoint-s3-csi-driver/overview

# Packages available in nixpkgs:
#   pkgs.fuse2  # fuse2 (2.9.9-r53)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.mountpoint-s3  # mountpoint-s3 (1.21.0-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xfsprogs  # xfsprogs (6.17.0-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   blkid (2.41.2-r2)
#   findmnt (2.41.2-r2)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libfdisk (2.41.2-r2)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   lsblk (2.41.2-r2)
#   mountpoint-s3-csi-driver-2.2 (2.2.1-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)
#   xfsprogs-core (6.17.0-r2)

# TODO: Implement mountpoint-s3-csi-driver image
throw "Image 'mountpoint-s3-csi-driver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.fuse2;
#   name = "mountpoint-s3-csi-driver";
#   tag = "v${pkgs.fuse2.version}";
#   entrypoint = [ "${pkgs.fuse2}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "mountpoint-s3-csi-driver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
