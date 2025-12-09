{ buildCLIImage, pkgs, lib, ... }:

# Image: eks-distro-kube-proxy
# Reference: https://images.chainguard.dev/directory/image/eks-distro-kube-proxy/overview

# Packages available in nixpkgs:
#   pkgs.conntrack-tools  # conntrack-tools (1.4.8-r41)
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
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nftables  # nftables (1.1.5-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   eks-distro-kube-proxy-1.34 (1.34.11-r0)
#   iptables-wrappers (2-r4)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   xtables (1.8.11-r29)

# TODO: Implement eks-distro-kube-proxy image
throw "Image 'eks-distro-kube-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.conntrack-tools;
#   name = "eks-distro-kube-proxy";
#   tag = "v${pkgs.conntrack-tools.version}";
#   entrypoint = [ "${pkgs.conntrack-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "eks-distro-kube-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
