{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-function-auto-ready
# Reference: https://images.chainguard.dev/directory/image/crossplane-function-auto-ready/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-function-auto-ready (0.6.0-r0)

# TODO: Implement crossplane-function-auto-ready image
throw "Image 'crossplane-function-auto-ready' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-function-auto-ready";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-function-auto-ready";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
