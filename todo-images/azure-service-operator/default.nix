{ buildCLIImage, pkgs, lib, ... }:

# Image: azure-service-operator
# Reference: https://images.chainguard.dev/directory/image/azure-service-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   azure-service-operator (2.17.0-r0)

# TODO: Implement azure-service-operator image
throw "Image 'azure-service-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "azure-service-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "azure-service-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
