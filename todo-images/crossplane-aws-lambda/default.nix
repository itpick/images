{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-lambda
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-lambda/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-lambda (2.2.0-r2)

# TODO: Implement crossplane-aws-lambda image
throw "Image 'crossplane-aws-lambda' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-lambda";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-lambda";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
