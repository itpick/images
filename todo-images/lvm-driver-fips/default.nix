{ buildCLIImage, pkgs, lib, ... }:

# Image: lvm-driver-fips
# Reference: https://images.chainguard.dev/directory/image/lvm-driver-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.btrfs-progs  # btrfs-progs (6.17.1-r1)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.lvm2  # lvm2 (2.03.37-r0)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xfsprogs  # xfsprogs (6.17.0-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   blkid (2.41.2-r2)
#   device-mapper (2.03.37-r0)
#   device-mapper-event-libs (2.03.37-r0)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-extra (1.47.3-r1)
#   e2fsprogs-libs (1.47.3-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libfdisk (2.41.2-r2)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   lvm-driver-fips (1.8.0-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)
#   wipefs (2.41.2-r2)
#   xfsprogs-core (6.17.0-r2)

# TODO: Implement lvm-driver-fips image
throw "Image 'lvm-driver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.btrfs-progs;
#   name = "lvm-driver-fips";
#   tag = "v${pkgs.btrfs-progs.version}";
#   entrypoint = [ "${pkgs.btrfs-progs}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "lvm-driver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
