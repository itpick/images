{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-autoscaler-addon-resizer
# Reference: https://images.chainguard.dev/directory/image/kubernetes-autoscaler-addon-resizer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   addon-resizer (1.8.23-r10)

# TODO: Implement kubernetes-autoscaler-addon-resizer image
throw "Image 'kubernetes-autoscaler-addon-resizer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-autoscaler-addon-resizer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-autoscaler-addon-resizer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
