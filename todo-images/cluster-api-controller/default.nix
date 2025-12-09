{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-1.9-controller (1.9.11-r4)

# TODO: Implement cluster-api-controller image
throw "Image 'cluster-api-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
