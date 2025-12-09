{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-clusterctl
# Reference: https://images.chainguard.dev/directory/image/cluster-api-clusterctl/overview

# TODO: Implement cluster-api-clusterctl image
throw "Image 'cluster-api-clusterctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-clusterctl";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-clusterctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
