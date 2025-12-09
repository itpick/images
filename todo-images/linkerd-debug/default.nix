{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-debug
# Reference: https://images.chainguard.dev/directory/image/linkerd-debug/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.conntrack-tools  # conntrack-tools (1.4.8-r41)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.fstrm  # fstrm (0.6.1-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnetfilter_conntrack  # libnetfilter_conntrack (1.1.0-r4)
#   pkgs.libnetfilter_cthelper  # libnetfilter_cthelper (1.0.1-r6)
#   pkgs.libnetfilter_cttimeout  # libnetfilter_cttimeout (1.0.1-r6)
#   pkgs.libnetfilter_queue  # libnetfilter_queue (1.0.5-r8)
#   pkgs.libnfnetlink  # libnfnetlink (1.0.2-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpcap  # libpcap (1.10.5-r3)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.lsof  # lsof (4.99.5-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.protobufc  # protobuf-c (1.5.2-r8)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.speexdsp  # speexdsp (1.2.1-r4)
#   pkgs.tcpdump  # tcpdump (4.99.5-r1)
#   pkgs.tshark  # tshark-4.4 (4.4.11-r0)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bind-libs (9.20.16-r0)
#   bind-tools (9.20.16-r0)
#   heimdal-libs (7.8.0-r42)
#   iptables-xtables-privileged (1.8.11-r29)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcap-utils (2.77-r0)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libfdisk (2.41.2-r2)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   linkerd2-debug (25.12.1-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nghttp2-dev (1.68.0-r0)
#   sed (4.9-r6)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   tshark-4.4-libs (4.4.11-r0)
#   util-linux-misc (2.41.2-r2)
#   xtables (1.8.11-r29)

# TODO: Implement linkerd-debug image
throw "Image 'linkerd-debug' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "linkerd-debug";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-debug";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
