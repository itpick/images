{ buildCLIImage, pkgs, lib, ... }:

# Image: celeborn
# Reference: https://images.chainguard.dev/directory/image/celeborn/overview

# Packages available in nixpkgs:
#   pkgs.alsa-lib  # alsa-lib (1.2.14-r2)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.fstrm  # fstrm (0.6.1-r3)
#   pkgs.giflib  # giflib (5.2.2-r11)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.jemalloc  # jemalloc (5.3.0-r6)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxdmcp  # libxdmcp (1.1.5-r9)
#   pkgs.libxext  # libxext (1.3.6-r7)
#   pkgs.libxi  # libxi (1.8.2-r4)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxrender  # libxrender (0.9.12-r4)
#   pkgs.libxtst  # libxtst (1.2.5-r4)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.openssh  # openssh (10.2_p1-r2)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.protobufc  # protobuf-c (1.5.2-r8)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   bind-libs (9.20.16-r0)
#   bind-tools (9.20.16-r0)
#   ca-certificates (20251003-r0)
#   celeborn-0.6 (0.6.1-r1)
#   java-cacerts (20251003-r0)
#   java-common-jre (0.2-r2)
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
#   libjemalloc2 (5.3.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nghttp2-dev (1.68.0-r0)
#   openjdk-8-default-jvm (8.472.08-r1)
#   openjdk-8-jre (8.472.08-r1)
#   openssh-client (10.2_p1-r2)
#   openssh-keygen (10.2_p1-r2)
#   openssh-server (10.2_p1-r2)
#   openssh-server-config (10.2_p1-r2)
#   openssh-sftp-server (10.2_p1-r2)
#   p11-kit-trust (0.25.10-r0)
#   sed (4.9-r6)

# TODO: Implement celeborn image
throw "Image 'celeborn' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.alsa-lib;
#   name = "celeborn";
#   tag = "v${pkgs.alsa-lib.version}";
#   entrypoint = [ "${pkgs.alsa-lib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10006";
#
#   labels = {
#     "org.opencontainers.image.title" = "celeborn";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
