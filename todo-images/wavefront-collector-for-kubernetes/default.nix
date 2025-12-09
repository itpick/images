{ buildCLIImage, pkgs, lib, ... }:

# Image: wavefront-collector-for-kubernetes
# Reference: https://images.chainguard.dev/directory/image/wavefront-collector-for-kubernetes/overview

# Packages NOT in nixpkgs (need custom derivations):
#   wavefront-collector-for-kubernetes-1.13 (1.13.0-r32)

# TODO: Implement wavefront-collector-for-kubernetes image
throw "Image 'wavefront-collector-for-kubernetes' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "wavefront-collector-for-kubernetes";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "wavefront-collector-for-kubernetes";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
