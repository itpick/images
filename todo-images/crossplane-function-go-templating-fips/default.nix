{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-function-go-templating-fips
# Reference: https://images.chainguard.dev/directory/image/crossplane-function-go-templating-fips/overview

# TODO: Implement crossplane-function-go-templating-fips image
throw "Image 'crossplane-function-go-templating-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-function-go-templating-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-function-go-templating-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
