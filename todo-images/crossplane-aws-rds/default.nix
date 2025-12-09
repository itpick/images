{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-rds
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-rds/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-rds (2.2.0-r2)

# TODO: Implement crossplane-aws-rds image
throw "Image 'crossplane-aws-rds' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-rds";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-rds";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
