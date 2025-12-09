{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-sns
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-sns/overview

# TODO: Implement crossplane-aws-sns image
throw "Image 'crossplane-aws-sns' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-sns";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-sns";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
