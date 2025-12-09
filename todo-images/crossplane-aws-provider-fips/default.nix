{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-provider-fips
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-provider-fips/overview

# TODO: Implement crossplane-aws-provider-fips image
throw "Image 'crossplane-aws-provider-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-provider-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-provider-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
