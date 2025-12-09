{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-cmctl
# Reference: https://images.chainguard.dev/directory/image/cert-manager-cmctl/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cert-manager-cmctl image
throw "Image 'cert-manager-cmctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cert-manager-cmctl";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-cmctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
