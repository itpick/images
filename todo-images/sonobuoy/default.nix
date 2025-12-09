{ buildCLIImage, pkgs, lib, ... }:

# Image: sonobuoy
# Reference: https://images.chainguard.dev/directory/image/sonobuoy/overview

# Packages available in nixpkgs:
#   pkgs.sonobuoy  # sonobuoy (0.57.3-r10)

# TODO: Implement sonobuoy image
throw "Image 'sonobuoy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.sonobuoy;
#   name = "sonobuoy";
#   tag = "v${pkgs.sonobuoy.version}";
#   entrypoint = [ "${pkgs.sonobuoy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sonobuoy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
