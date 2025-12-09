{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-dynamodb
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-dynamodb/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-dynamodb (2.2.0-r2)

# TODO: Implement crossplane-aws-dynamodb image
throw "Image 'crossplane-aws-dynamodb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-dynamodb";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-dynamodb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
