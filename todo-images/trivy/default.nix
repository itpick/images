{ buildCLIImage, pkgs, lib, ... }:

# Image: trivy
# Reference: https://images.chainguard.dev/directory/image/trivy/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.trivy  # trivy (0.68.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement trivy image
throw "Image 'trivy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.trivy;
#   name = "trivy";
#   tag = "v${pkgs.trivy.version}";
#   entrypoint = [ "${pkgs.trivy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "trivy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
