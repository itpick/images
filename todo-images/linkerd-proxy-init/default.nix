{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-proxy-init
# Reference: https://images.chainguard.dev/directory/image/linkerd-proxy-init/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   iptables-xtables-privileged (1.8.11-r29)
#   ld-linux (2.42-r4)
#   libcap-utils (2.77-r0)
#   linkerd2-proxy-init (2.4.3-r7)
#   xtables (1.8.11-r29)

# TODO: Implement linkerd-proxy-init image
throw "Image 'linkerd-proxy-init' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "linkerd-proxy-init";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-proxy-init";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
