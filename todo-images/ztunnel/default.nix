{ buildCLIImage, pkgs, lib, ... }:

# Image: ztunnel
# Reference: https://images.chainguard.dev/directory/image/ztunnel/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnetfilter_conntrack  # libnetfilter_conntrack (1.1.0-r4)
#   pkgs.libnfnetlink  # libnfnetlink (1.0.2-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   iptables-wrappers (2-r4)
#   ld-linux (2.42-r4)
#   xtables (1.8.11-r29)
#   ztunnel-1.28 (1.28.1-r1)

# TODO: Implement ztunnel image
throw "Image 'ztunnel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ztunnel";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ztunnel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
