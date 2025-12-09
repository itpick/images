{ buildCLIImage, pkgs, lib, ... }:

# Image: kiam
# Reference: https://images.chainguard.dev/directory/image/kiam/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   iptables-wrappers (2-r4)
#   kiam (4.2-r31)
#   ld-linux (2.42-r4)
#   xtables (1.8.11-r29)

# TODO: Implement kiam image
throw "Image 'kiam' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kiam";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "kiam";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
