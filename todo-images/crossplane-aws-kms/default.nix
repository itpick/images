{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-kms
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-kms/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-kms (2.2.0-r2)

# TODO: Implement crossplane-aws-kms image
throw "Image 'crossplane-aws-kms' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-kms";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-kms";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
