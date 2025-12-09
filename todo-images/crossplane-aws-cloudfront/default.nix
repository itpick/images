{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-cloudfront
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-cloudfront/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-cloudfront (2.2.0-r2)

# TODO: Implement crossplane-aws-cloudfront image
throw "Image 'crossplane-aws-cloudfront' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-cloudfront";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-cloudfront";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
