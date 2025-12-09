{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-whisker
# Reference: https://images.chainguard.dev/directory/image/calico-whisker/overview

# Packages available in nixpkgs:
#   pkgs.apk-tools  # apk-tools (2.14.10-r9)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-whisker-3.31 (3.31.2-r3)
#   dash-binsh (0.5.13-r2)
#   harbor-2.9-portal-nginx-config (2.9.5-r17)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sed (4.9-r6)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement calico-whisker image
throw "Image 'calico-whisker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.apk-tools;
#   name = "calico-whisker";
#   tag = "v${pkgs.apk-tools.version}";
#   entrypoint = [ "${pkgs.apk-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10001";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-whisker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
