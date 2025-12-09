{ buildCLIImage, pkgs, lib, ... }:

# Image: jupyterhub-k8s-network-tools
# Reference: https://images.chainguard.dev/directory/image/jupyterhub-k8s-network-tools/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmnl  # libmnl (1.0.5-r6)
#   pkgs.libnftnl  # libnftnl (1.3.1-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   iptables-wrappers (2-r4)
#   jupyterhub-k8s-network-tools (4.3.1-r1)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   xtables (1.8.11-r29)

# TODO: Implement jupyterhub-k8s-network-tools image
throw "Image 'jupyterhub-k8s-network-tools' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "jupyterhub-k8s-network-tools";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "jupyterhub-k8s-network-tools";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
