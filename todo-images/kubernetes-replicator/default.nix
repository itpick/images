{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-replicator
# Reference: https://images.chainguard.dev/directory/image/kubernetes-replicator/overview

# TODO: Implement kubernetes-replicator image
throw "Image 'kubernetes-replicator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-replicator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-replicator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
