{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-sqs
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-sqs/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-sqs (2.2.0-r2)

# TODO: Implement crossplane-aws-sqs image
throw "Image 'crossplane-aws-sqs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-sqs";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-sqs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
