{ buildCLIImage, pkgs, lib, ... }:

# Image: ip-masq-agent
# Reference: https://images.chainguard.dev/directory/image/ip-masq-agent/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.iptables  # iptables (1.8.11-r29)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ip-masq-agent (2.12.0-r15)
#   ip6tables (1.8.11-r29)
#   ld-linux (2.42-r4)
#   xtables (1.8.11-r29)

# TODO: Implement ip-masq-agent image
throw "Image 'ip-masq-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ip-masq-agent";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "ip-masq-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
