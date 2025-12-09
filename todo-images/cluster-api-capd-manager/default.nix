{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-capd-manager
# Reference: https://images.chainguard.dev/directory/image/cluster-api-capd-manager/overview

# TODO: Implement cluster-api-capd-manager image
throw "Image 'cluster-api-capd-manager' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-capd-manager";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-capd-manager";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
