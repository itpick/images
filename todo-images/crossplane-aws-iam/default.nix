{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-iam
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-iam/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-iam (2.2.0-r2)

# TODO: Implement crossplane-aws-iam image
throw "Image 'crossplane-aws-iam' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-iam";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-iam";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
