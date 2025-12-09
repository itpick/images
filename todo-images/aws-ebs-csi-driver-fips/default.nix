{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-ebs-csi-driver-fips
# Reference: https://images.chainguard.dev/directory/image/aws-ebs-csi-driver-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xfsprogs  # xfsprogs-5.10 (5.10.0-r42)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-ebs-csi-driver-fips-1.53 (1.53.0-r0)
#   blkid (2.41.2-r2)
#   blockdev (2.41.2-r2)
#   ca-certificates (20251003-r0)
#   e2fsprogs-extra (1.47.3-r1)
#   e2fsprogs-libs (1.47.3-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcom_err (1.47.3-r1)
#   libcrypto3 (3.6.0-r4)
#   libfdisk (2.41.2-r2)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   lsblk (2.41.2-r2)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)
#   xfsprogs-5.10-libs (5.10.0-r42)

# TODO: Implement aws-ebs-csi-driver-fips image
throw "Image 'aws-ebs-csi-driver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.e2fsprogs;
#   name = "aws-ebs-csi-driver-fips";
#   tag = "v${pkgs.e2fsprogs.version}";
#   entrypoint = [ "${pkgs.e2fsprogs}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-ebs-csi-driver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
