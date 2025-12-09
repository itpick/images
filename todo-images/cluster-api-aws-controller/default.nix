{ buildCLIImage, pkgs, lib, ... }:

# Image: cluster-api-aws-controller
# Reference: https://images.chainguard.dev/directory/image/cluster-api-aws-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cluster-api-aws-controller (2.9.3-r0)

# TODO: Implement cluster-api-aws-controller image
throw "Image 'cluster-api-aws-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cluster-api-aws-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cluster-api-aws-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
