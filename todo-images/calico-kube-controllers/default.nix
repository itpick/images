{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-kube-controllers
# Reference: https://images.chainguard.dev/directory/image/calico-kube-controllers/overview

# TODO: Implement calico-kube-controllers image
throw "Image 'calico-kube-controllers' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "calico-kube-controllers";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-kube-controllers";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
