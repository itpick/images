{ buildCLIImage, pkgs, lib, ... }:

# Image: longhorn-ui-fips
# Reference: https://images.chainguard.dev/directory/image/longhorn-ui-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.0-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   glibc-iconv (2.42-r4)
#   harbor-2.9-portal-nginx-config (2.9.5-r17)
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
#   libgomp (15.2.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   longhorn-ui-1.10 (1.10.1-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   xtables (1.8.11-r28)

# TODO: Implement longhorn-ui-fips image
throw "Image 'longhorn-ui-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gettext;
#   name = "longhorn-ui-fips";
#   tag = "v${pkgs.gettext.version}";
#   entrypoint = [ "${pkgs.gettext}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "499";
#
#   labels = {
#     "org.opencontainers.image.title" = "longhorn-ui-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
