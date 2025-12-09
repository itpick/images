{ buildCLIImage, pkgs, lib, ... }:

# Image: eks-distro-coredns
# Reference: https://images.chainguard.dev/directory/image/eks-distro-coredns/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   eks-distro-coredns-1.34 (1.34.11-r0)
#   ld-linux (2.42-r4)

# TODO: Implement eks-distro-coredns image
throw "Image 'eks-distro-coredns' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "eks-distro-coredns";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "eks-distro-coredns";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
