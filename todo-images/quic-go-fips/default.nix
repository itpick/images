{ buildCLIImage, pkgs, lib, ... }:

# Image: quic-go-fips
# Reference: https://images.chainguard.dev/directory/image/quic-go-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.ethtool  # ethtool (6.15-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hostname  # hostname (3.25-r0)
#   pkgs.iperf  # iperf (2.2.1-r2)
#   pkgs.iproute2  # iproute2 (6.17.0-r2)
#   pkgs.iputils  # iputils (20250605-r1)
#   pkgs.libbpf  # libbpf (1.6.2-r0)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libelf  # libelf (0.194-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libpcap  # libpcap (1.10.5-r3)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.tcpdump  # tcpdump (4.99.5-r1)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   quic-go-client-fips (0.57.1-r1)
#   quic-go-fips (0.57.1-r1)
#   quic-go-server-fips (0.57.1-r1)
#   quic-network-simulator (0_git20251118-r0)
#   wait-for-it (0.20200823-r7)
#   xtables (1.8.11-r29)

# TODO: Implement quic-go-fips image
throw "Image 'quic-go-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.ethtool;
#   name = "quic-go-fips";
#   tag = "v${pkgs.ethtool.version}";
#   entrypoint = [ "${pkgs.ethtool}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "quic-go-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
