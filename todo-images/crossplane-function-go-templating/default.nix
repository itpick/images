{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-function-go-templating
# Reference: https://images.chainguard.dev/directory/image/crossplane-function-go-templating/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-function-go-templating (0.11.2-r0)

# TODO: Implement crossplane-function-go-templating image
throw "Image 'crossplane-function-go-templating' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-function-go-templating";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-function-go-templating";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
