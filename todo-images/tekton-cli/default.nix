{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-cli
# Reference: https://images.chainguard.dev/directory/image/tekton-cli/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   tkn (0.43.0-r1)

# TODO: Implement tekton-cli image
throw "Image 'tekton-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-cli";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
