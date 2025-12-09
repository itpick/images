{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-azure-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-azure-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-azure-controller (1.21.1-r2)

# TODO: Implement cluster-api-azure-controller image
throw "Image 'cluster-api-azure-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-azure-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-azure-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
