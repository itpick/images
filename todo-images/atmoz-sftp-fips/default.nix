{ buildCLIImage, pkgs, lib, ... }:

# Image: atmoz-sftp-fips
# Reference: https://images.chainguard.dev/directory/image/atmoz-sftp-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsemanage  # libsemanage (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.shadow  # shadow (4.18.0-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   atmoz-sftp (0.0.0_git20251205-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libaudit (4.1.2-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   openssh-keygen (10.2_p1-r2)
#   openssh-server (10.2_p1-r2)
#   openssh-server-config (10.2_p1-r2)
#   openssh-sftp-server (10.2_p1-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   sed (4.9-r6)

# TODO: Implement atmoz-sftp-fips image
throw "Image 'atmoz-sftp-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "atmoz-sftp-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "atmoz-sftp-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
