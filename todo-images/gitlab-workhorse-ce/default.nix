{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-workhorse-ce
# Reference: https://images.chainguard.dev/directory/image/gitlab-workhorse-ce/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.exiftool  # exiftool (13.43-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gomplate  # gomplate (4.3.3-r5)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.less  # less (688-r0)
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
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ca-certificates (20251003-r0)
#   gitlab-base-18.6 (18.6.1-r0)
#   gitlab-logger-18.6 (18.6.1-r0)
#   gitlab-rails-ce-assets-18.6 (18.6.1-r1)
#   gitlab-workhorse-ce-18.6 (18.6.1-r0)
#   gitlab-workhorse-scripts-18.6 (18.6.1-r0)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sed (4.9-r6)
#   sqlite-libs (3.51.1-r0)
#   xtail (2.1.12-r0)

# TODO: Implement gitlab-workhorse-ce image
throw "Image 'gitlab-workhorse-ce' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "gitlab-workhorse-ce";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-workhorse-ce";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
