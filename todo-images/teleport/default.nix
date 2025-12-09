{ buildCLIImage, pkgs, lib, ... }:

# Image: teleport
# Reference: https://images.chainguard.dev/directory/image/teleport/overview

# Packages available in nixpkgs:
#   pkgs.audit  # audit (4.1.2-r1)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.teleport  # teleport-18 (18.5.0-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   gettext-dev (0.26-r1)
#   glibc-iconv (2.42-r4)
#   ld-linux (2.42-r4)
#   libaudit (4.1.2-r1)
#   libcrypt1 (2.42-r4)
#   libgomp (15.2.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   linux-pam-dev (1.7.1-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)

# TODO: Implement teleport image
throw "Image 'teleport' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.teleport;
#   name = "teleport";
#   tag = "v${pkgs.teleport.version}";
#   entrypoint = [ "${pkgs.teleport}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "teleport";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
