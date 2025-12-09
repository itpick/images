{ buildCLIImage, pkgs, lib, ... }:

# Image: azurefile-csi
# Reference: https://images.chainguard.dev/directory/image/azurefile-csi/overview

# Packages available in nixpkgs:
#   pkgs.azure-storage-azcopy  # azcopy (10.31.0-r2)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cifs-utils  # cifs-utils (7.4-r5)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nfs-utils  # nfs-utils (2.8.4-r1)
#   pkgs.python  # python-3.13 (3.13.10-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.talloc  # talloc (2.4.3-r4)
#   pkgs.udev  # udev (258.2-r3)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.xfsprogs  # xfsprogs (6.17.0-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   azurefile-csi-1.33 (1.33.6-r2)
#   dash-binsh (0.5.13-r2)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libaudit (4.1.2-r1)
#   libblkid (2.41.2-r2)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libnl3 (3.12.0-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd-shared (258.2-r3)
#   libwbclient (4.23.3-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   python-3.13-base (3.13.10-r0)
#   sqlite-libs (3.51.1-r0)
#   xfsprogs-core (6.17.0-r2)

# TODO: Implement azurefile-csi image
throw "Image 'azurefile-csi' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.azure-storage-azcopy;
#   name = "azurefile-csi";
#   tag = "v${pkgs.azure-storage-azcopy.version}";
#   entrypoint = [ "${pkgs.azure-storage-azcopy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "azurefile-csi";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
