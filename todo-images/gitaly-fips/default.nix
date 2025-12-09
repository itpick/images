{ buildCLIImage, pkgs, lib, ... }:

# Image: gitaly-fips
# Reference: https://images.chainguard.dev/directory/image/gitaly-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.bzip2  # bzip2 (1.0.8-r21)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.less  # less (688-r0)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ca-certificates (20251003-r0)
#   gitaly-backup-fips-18.6 (18.6.1-r1)
#   gitaly-config-18.6 (18.6.1-r0)
#   gitaly-fips-18.6 (18.6.1-r1)
#   gitaly-git-fips-18.6 (18.6.1-r1)
#   gitlab-base-fips-18.6 (18.6.1-r1)
#   gitlab-gitaly-scripts-18.6 (18.6.1-r0)
#   gitlab-logger-fips-18.6 (18.6.1-r1)
#   gomplate-fips (4.3.3-r6)
#   heimdal-libs (7.8.0-r42)
#   icu-dev (78.1-r0)
#   icu78-data-full (78.1-r0)
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
#   libedit-dev (3.1-r13)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-dev (6.5_p20251025-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   pcre2-dev (10.47-r0)
#   py3-pip-wheel (25.3-r2)
#   py3.13-git-filter-repo (2.47.0-r3)
#   py3.13-git-filter-repo-bin (2.47.0-r3)
#   python-3.13-base (3.13.11-r0)
#   sed (4.9-r6)
#   sqlite-libs (3.51.1-r0)
#   xtables (1.8.11-r29)
#   xtail (2.1.12-r0)
#   zlib-dev (1.3.1-r51)

# TODO: Implement gitaly-fips image
throw "Image 'gitaly-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bzip2;
#   name = "gitaly-fips";
#   tag = "v${pkgs.bzip2.version}";
#   entrypoint = [ "${pkgs.bzip2}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitaly-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
