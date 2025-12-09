{ buildCLIImage, pkgs, lib, ... }:

# Image: docker-dind-fips
# Reference: https://images.chainguard.dev/directory/image/docker-dind-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.btrfs-progs  # btrfs-progs (6.17.1-r1)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.e2fsprogs  # e2fsprogs (1.47.3-r1)
#   pkgs.fuse-overlayfs  # fuse-overlayfs (1.16-r0)
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inih  # inih (62-r1)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.0-r0)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsemanage  # libsemanage (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.liburcu  # liburcu (0.15.5-r0)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.pigz  # pigz (2.8-r3)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.shadow  # shadow (4.18.0-r6)
#   pkgs.xfsprogs  # xfsprogs (6.17.0-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zfs  # zfs (2.3.5-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   containerd-fips (2.2.0-r3)
#   containerd-shim-runc-v2-fips (2.2.0-r3)
#   containerd-stress-fips (2.2.0-r3)
#   ctr-fips (2.2.0-r3)
#   docker-cli-buildx-fips (0.30.1-r2)
#   docker-cli-fips (29.1.2-r0)
#   docker-compose-fips (5.0.0-r1)
#   docker-dind (28.5.2-r6)
#   docker-fips (28.5.2-r2)
#   docker-init-fips (28.5.2-r2)
#   docker-oci-entrypoint (28.5.2-r6)
#   dockerd-fips (28.5.2-r2)
#   dockerd-oci-entrypoint (28.5.2-r6)
#   e2fsprogs-extra (1.47.3-r1)
#   e2fsprogs-libs (1.47.3-r1)
#   fuse3-libs (3.17.4-r0)
#   heimdal-libs (7.8.0-r42)
#   iptables-wrappers (2-r4)
#   just-newuidmap-newgidmap (4.18.0-r6)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
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
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   runc-fips (1.4.0-r0)
#   shadow-subids (4.18.0-r6)
#   sqlite-libs (3.51.1-r0)
#   tini-static (0.19.0-r22)
#   xfsprogs-core (6.17.0-r2)
#   xtables (1.8.11-r29)

# TODO: Implement docker-dind-fips image
throw "Image 'docker-dind-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.btrfs-progs;
#   name = "docker-dind-fips";
#   tag = "v${pkgs.btrfs-progs.version}";
#   entrypoint = [ "${pkgs.btrfs-progs}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "docker-dind-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
