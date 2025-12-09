{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-fluentd-operator
# Reference: https://images.chainguard.dev/directory/image/kube-fluentd-operator/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.jemalloc  # jemalloc (5.3.0-r6)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libssh  # libssh (0.11.3-r0)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.ruby  # ruby-3.2 (3.2.9-r2)
#   pkgs.systemd  # systemd (258.2-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dbus-libs (1.16.2-r5)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   kube-fluentd-operator (1.18.2-r51)
#   kube-fluentd-operator-default-config (1.18.2-r51)
#   kube-fluentd-operator-oci-entrypoint (1.18.2-r51)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
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
#   libjemalloc2 (5.3.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   libsystemd-shared (258.2-r3)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   quota-tools (4.10-r1)
#   ruby3.2-bundler (4.0.0-r0)
#   sqlite-libs (3.51.1-r0)
#   systemd-boot (258.2-r3)
#   systemd-systemctl (258.2-r3)

# TODO: Implement kube-fluentd-operator image
throw "Image 'kube-fluentd-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cryptsetup;
#   name = "kube-fluentd-operator";
#   tag = "v${pkgs.cryptsetup.version}";
#   entrypoint = [ "${pkgs.cryptsetup}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-fluentd-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
