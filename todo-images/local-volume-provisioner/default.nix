{ buildCLIImage, pkgs, lib, ... }:

# Image: local-volume-provisioner
# Reference: https://images.chainguard.dev/directory/image/local-volume-provisioner/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.sqlite  # sqlite (3.51.1-r0)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   e2fsprogs-dev (1.47.3-r1)
#   e2fsprogs-libs (1.47.3-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libedit-dev (3.1-r13)
#   libfdisk (2.41.2-r2)
#   libmount (2.41.2-r2)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libselinux-dev (3.9-r1)
#   libsepol-dev (3.9-r1)
#   local-static-provisioner (2.8.0-r6)
#   ncurses-dev (6.5_p20251025-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   pcre2-dev (10.47-r0)
#   setarch (2.41.2-r2)
#   sqlite-dev (3.51.1-r0)
#   sqlite-libs (3.51.1-r0)
#   util-linux-dev (2.41.2-r2)
#   util-linux-misc (2.41.2-r2)
#   zlib-dev (1.3.1-r51)

# TODO: Implement local-volume-provisioner image
throw "Image 'local-volume-provisioner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gawk;
#   name = "local-volume-provisioner";
#   tag = "v${pkgs.gawk.version}";
#   entrypoint = [ "${pkgs.gawk}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "local-volume-provisioner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
