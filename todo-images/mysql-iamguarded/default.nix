{ buildCLIImage, pkgs, lib, ... }:

# Image: mysql-iamguarded
# Reference: https://images.chainguard.dev/directory/image/mysql-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mysql-client  # mysql-8.4 (8.4.7-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.pwgen  # pwgen (2.08-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ini-file (1.4.9-r3)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   mysql-8.4-client (8.4.7-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement mysql-iamguarded image
throw "Image 'mysql-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "mysql-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "mysql-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
