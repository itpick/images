{ buildCLIImage, pkgs, lib, ... }:

# Image: flux-image-reflector-controller
# Reference: https://images.chainguard.dev/directory/image/flux-image-reflector-controller/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   flux-image-reflector-controller (1.0.4-r3)
#   ld-linux (2.42-r4)

# TODO: Implement flux-image-reflector-controller image
throw "Image 'flux-image-reflector-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "flux-image-reflector-controller";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux-image-reflector-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
