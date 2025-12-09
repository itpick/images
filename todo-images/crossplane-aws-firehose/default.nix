{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-firehose
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-firehose/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-firehose (2.2.0-r2)

# TODO: Implement crossplane-aws-firehose image
throw "Image 'crossplane-aws-firehose' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-firehose";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-firehose";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
