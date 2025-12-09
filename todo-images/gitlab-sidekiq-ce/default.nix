{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-sidekiq-ce
# Reference: https://images.chainguard.dev/directory/image/gitlab-sidekiq-ce/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.cosign  # cosign (3.0.2-r3)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.exiftool  # exiftool (13.43-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.gomplate  # gomplate (4.3.3-r5)
#   pkgs.gpgme  # gpgme (2.0.1-r1)
#   pkgs.graphicsmagick  # graphicsmagick (1.3.46-r0)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.krb5  # krb5 (1.22.1-r1)
#   pkgs.less  # less (688-r0)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libpq  # libpq-17 (17.7-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxml2  # libxml2 (2.15.1-r2)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.python  # python-3.9 (3.9.25-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.ruby  # ruby-3.2 (3.2.9-r2)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ca-certificates (20251003-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   gitlab-base-18.5 (18.5.3-r1)
#   gitlab-logger-18.5 (18.5.3-r1)
#   gitlab-rails-ce-18.5 (18.5.3-r1)
#   gitlab-rails-ce-assets-18.5 (18.5.3-r1)
#   gitlab-rails-scripts-18.5 (18.5.3-r1)
#   gitlab-sidekiq-ce-18.5 (18.5.3-r1)
#   heimdal-libs (7.8.0-r42)
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
#   libexpat1 (2.7.3-r0)
#   libgomp (15.2.0-r6)
#   libicu78 (78.1-r0)
#   libjemalloc2 (5.3.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libltdl (2.5.4-r0)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   posix-libc-utils (2.42-r4)
#   postgresql-17-client (17.7-r0)
#   postgresql-17-client-base (17.7-r0)
#   py3-pip-wheel (25.3-r2)
#   py3-setuptools-wheel (80.9.0-r3)
#   python-3.9-base (3.9.25-r0)
#   ruby3.2-bundler (4.0.0-r0)
#   sed (4.9-r6)
#   sqlite-libs (3.51.1-r0)
#   tiff (4.7.1-r0)
#   xtail (2.1.12-r0)

# TODO: Implement gitlab-sidekiq-ce image
throw "Image 'gitlab-sidekiq-ce' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cosign;
#   name = "gitlab-sidekiq-ce";
#   tag = "v${pkgs.cosign.version}";
#   entrypoint = [ "${pkgs.cosign}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-sidekiq-ce";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
