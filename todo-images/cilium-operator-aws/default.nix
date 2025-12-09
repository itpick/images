{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-operator-aws
# Reference: https://images.chainguard.dev/directory/image/cilium-operator-aws/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gops  # gops (0.3.28-r22)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-1.18-operator-aws (1.18.4-r2)
#   ld-linux (2.42-r4)

# TODO: Implement cilium-operator-aws image
throw "Image 'cilium-operator-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-operator-aws";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-operator-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
