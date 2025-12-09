{ buildCLIImage, pkgs, lib, ... }:

# Image: k3s-static
# Reference: https://images.chainguard.dev/directory/image/k3s-static/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.conntrack-tools  # conntrack-tools (1.4.8-r41)
#   pkgs.fuse-overlayfs  # fuse-overlayfs (1.16-r0)
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.ipset  # ipset (7.24-r2)
#   pkgs.jansson  # jansson (2.14.1-r1)
#   pkgs.kmod  # kmod (34.2-r42)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnetfilter_conntrack  # libnetfilter_conntrack (1.1.0-r4)
#   pkgs.libnetfilter_cthelper  # libnetfilter_cthelper (1.0.1-r6)
#   pkgs.libnetfilter_cttimeout  # libnetfilter_cttimeout (1.0.1-r6)
#   pkgs.libnetfilter_queue  # libnetfilter_queue (1.0.5-r8)
#   pkgs.libnfnetlink  # libnfnetlink (1.0.2-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nftables  # nftables (1.1.5-r2)
#   pkgs.runc  # runc (1.4.0-r0)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   fuse-overlayfs-snapshotter (2.1.7-r1)
#   fuse3-libs (3.17.4-r0)
#   iptables-wrappers (2-r4)
#   k3s-static (1.34.2.1-r1)
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   xtables (1.8.11-r29)

# TODO: Implement k3s-static image
throw "Image 'k3s-static' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.conntrack-tools;
#   name = "k3s-static";
#   tag = "v${pkgs.conntrack-tools.version}";
#   entrypoint = [ "${pkgs.conntrack-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "k3s-static";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
