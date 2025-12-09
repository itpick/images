{ buildCLIImage, pkgs, lib, ... }:

# Image: backing-image-manager-fips
# Reference: https://images.chainguard.dev/directory/image/backing-image-manager-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cifs-utils  # cifs-utils (7.4-r5)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.fuse2  # fuse2 (2.9.9-r53)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.iperf3  # iperf3 (3.20-r0)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.iputils  # iputils (20250605-r1)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.0-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.liburing  # liburing (2.12-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nfs-utils  # nfs-utils (2.8.4-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.python  # python-3.13 (3.13.10-r0)
#   pkgs.qemu-utils  # qemu-utils (10.1.2-r2)
#   pkgs.rdma-core  # rdma-core (60.0-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.sg3_utils  # sg3-utils (1.48-r1)
#   pkgs.talloc  # talloc (2.4.3-r4)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-extra (1.47.3-r1)
#   e2fsprogs-libs (1.47.3-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libnl3 (3.11.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libwbclient (4.23.3-r0)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   py3-pip-wheel (25.3-r2)
#   python-3.13-base (3.13.10-r0)
#   sqlite-libs (3.51.1-r0)
#   xfsprogs-core (6.17.0-r2)
#   xfsprogs-extra (6.17.0-r2)
#   xfsprogs-protofile-py-3.13 (6.17.0-r2)
#   xtables (1.8.11-r28)

# TODO: Implement backing-image-manager-fips image
throw "Image 'backing-image-manager-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cifs-utils;
#   name = "backing-image-manager-fips";
#   tag = "v${pkgs.cifs-utils.version}";
#   entrypoint = [ "${pkgs.cifs-utils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "backing-image-manager-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
