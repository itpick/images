{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-gcp-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-gcp-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-gcp-controller (1.10.0-r6)

# TODO: Implement cluster-api-gcp-controller image
throw "Image 'cluster-api-gcp-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-gcp-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-gcp-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
