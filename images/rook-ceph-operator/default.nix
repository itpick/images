# rook-ceph-operator
# =============
# Placeholder for rook-ceph-operator container image.
# This image is referenced in Helm charts but not yet implemented.
#
# TODO: Implement this image
# Reference: Check chart-images.json for source image details
#
# Example patterns to follow:
#   - Go binary: See images/external-dns/default.nix
#   - nixpkgs package: See images/kubectl/default.nix
#   - Java app: See images/jdk/default.nix

{ ... }:


# Chainguard SBOM packages for rook-ceph-operator:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.ceph  # ceph-19 (19.2.3-r13)
#   pkgs.chrony  # chrony (4.8-r5)
#   pkgs.conmon  # conmon (2.1.13-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.crun  # crun (1.25.1-r0)
#   pkgs.cryptsetup  # cryptsetup (2.8.1-r0)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dbus  # dbus (1.16.2-r5)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glib  # glib (2.87.0-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.glog  # glog (0.7.1-r2)
#   pkgs.gpgme  # gpgme (2.0.1-r1)
#   pkgs.grpc  # grpc-1.76 (1.76.0-r2)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.inih  # inih (62-r1)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.json_c  # json-c (0.18-r4)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   ... and 58 more
# Packages NOT in nixpkgs:
#   apache-arrow (22.0.0-r1)
#   blkid (2.41.2-r2)
#   ceph-19-libs (19.2.3-r13)
#   dbus-libs (1.16.2-r5)
#   device-mapper (2.03.37-r0)
#   device-mapper-event-libs (2.03.37-r0)
#   device-mapper-libs (2.03.37-r0)
#   e2fsprogs-libs (1.47.3-r1)
#   fuse3-libs (3.17.4-r0)
#   gmock (1.17.0-r3)
#   grafana-grafonnet (0.0_git20231114-r3)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   ... and 106 more

throw "Image 'rook-ceph-operator' is not yet implemented. See default.nix for implementation notes."
