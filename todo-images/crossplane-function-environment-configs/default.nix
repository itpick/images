{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-function-environment-configs
# Reference: https://images.chainguard.dev/directory/image/crossplane-function-environment-configs/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-function-environment-configs (0.5.0-r1)

# TODO: Implement crossplane-function-environment-configs image
throw "Image 'crossplane-function-environment-configs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-function-environment-configs";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-function-environment-configs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
