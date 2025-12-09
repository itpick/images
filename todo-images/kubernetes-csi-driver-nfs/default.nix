{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-driver-nfs
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-driver-nfs/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libssh  # libssh (0.11.3-r0)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nfs-utils  # nfs-utils (2.8.4-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.python  # python-3.13 (3.13.10-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.stunnel  # stunnel (5.76-r0)
#   pkgs.systemd  # systemd (258.2-r3)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dbus-libs (1.16.2-r5)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   efs-utils (2.4.1-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   kubernetes-csi-driver-nfs (4.12.1-r3)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libaudit (4.1.2-r1)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfdisk (2.41.2-r2)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libnl3 (3.12.0-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   libsystemd-shared (258.2-r3)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   py3.13-botocore (1.42.3-r0)
#   py3.13-jmespath (1.0.1-r8)
#   py3.13-python-dateutil (2.9.0-r10)
#   py3.13-six (1.17.0-r2)
#   py3.13-urllib3 (2.5.0-r2)
#   python-3.13-base (3.13.10-r0)
#   quota-tools (4.10-r1)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   systemd-boot (258.2-r3)
#   systemd-systemctl (258.2-r3)
#   util-linux-misc (2.41.2-r2)

# TODO: Implement kubernetes-csi-driver-nfs image
throw "Image 'kubernetes-csi-driver-nfs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cryptsetup;
#   name = "kubernetes-csi-driver-nfs";
#   tag = "v${pkgs.cryptsetup.version}";
#   entrypoint = [ "${pkgs.cryptsetup}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-driver-nfs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
