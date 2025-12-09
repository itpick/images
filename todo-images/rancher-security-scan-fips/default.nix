{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-security-scan-fips
# Reference: https://images.chainguard.dev/directory/image/rancher-security-scan-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.diffutils  # diffutils (3.12-r3)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnutar  # gnutar (1.35-r6)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
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
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.systemd  # systemd (258.2-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dbus-libs (1.16.2-r5)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   gnutar-rmt (1.35-r6)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   kube-bench-configs-fips (0.14.0-r2)
#   kube-bench-fips (0.14.0-r2)
#   kubectl-fips-1.34 (1.34.2-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libaudit (4.1.2-r1)
#   libblkid (2.41.2-r2)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libfdisk (2.41.2-r2)
#   libldap-2.6 (2.6.10-r7)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libsystemd (258.2-r3)
#   libsystemd-shared (258.2-r3)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   quota-tools (4.10-r1)
#   rancher-security-scan-fips-0.6 (0.6.5-r1)
#   sonobuoy-fips (0.57.3-r3)
#   sqlite-libs (3.51.1-r0)
#   systemd-boot (258.2-r3)
#   systemd-systemctl (258.2-r3)

# TODO: Implement rancher-security-scan-fips image
throw "Image 'rancher-security-scan-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cryptsetup;
#   name = "rancher-security-scan-fips";
#   tag = "v${pkgs.cryptsetup.version}";
#   entrypoint = [ "${pkgs.cryptsetup}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-security-scan-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
