{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-s3
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-s3/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-s3 (2.2.0-r2)

# TODO: Implement crossplane-aws-s3 image
throw "Image 'crossplane-aws-s3' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-s3";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-s3";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
