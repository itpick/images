{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-agent
# Reference: https://images.chainguard.dev/directory/image/rancher-agent/overview

# Packages available in nixpkgs:
#   pkgs.acl  # acl (2.3.2-r54)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r1)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.0-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.sqlite  # sqlite (3.51.1-r0)
#   pkgs.sysstat  # sysstat (12.7.8-r0)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.vim  # vim (9.1.1952-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   acl-dev (2.3.2-r54)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   kubectl-1.34-default (1.34.2-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libedit-dev (3.1-r13)
#   libexpat1 (2.7.3-r0)
#   libfdisk (2.41.2-r2)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libselinux-dev (3.9-r1)
#   libsepol-dev (3.9-r1)
#   libssl3 (3.6.0-r4)
#   libzstd1 (1.5.7-r5)
#   ncurses-dev (6.5_p20251025-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   pcre2-dev (10.47-r0)
#   posix-libc-utils (2.42-r4)
#   rancher-agent-2.9 (2.9.12-r4)
#   rancher-charts-2.9 (0_git20251124-r0)
#   rancher-helm3-charts (0_git20251111-r0)
#   rancher-kontainer-driver-metadata-2.9 (0_git20251117-r0)
#   rancher-loglevel (0.1.6-r8)
#   rancher-partner-charts (0_git20251204-r0)
#   rancher-rke2-charts (0_git20251204-r1)
#   rancher-system-charts-2.9 (0_git20251112-r0)
#   setarch (2.41.2-r2)
#   sqlite-dev (3.51.1-r0)
#   sqlite-libs (3.51.1-r0)
#   util-linux-dev (2.41.2-r2)
#   util-linux-misc (2.41.2-r2)
#   xtables (1.8.11-r29)
#   zlib-dev (1.3.1-r51)

# TODO: Implement rancher-agent image
throw "Image 'rancher-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.acl;
#   name = "rancher-agent";
#   tag = "v${pkgs.acl.version}";
#   entrypoint = [ "${pkgs.acl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
