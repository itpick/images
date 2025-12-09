{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-helm-controller-iamguarded
# Reference: https://images.chainguard.dev/directory/image/flux-helm-controller-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   flux-helm-controller (1.4.5-r1)
#   ld-linux (2.42-r4)

# TODO: Implement flux-helm-controller-iamguarded image
throw "Image 'flux-helm-controller-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "flux-helm-controller-iamguarded";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-helm-controller-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
