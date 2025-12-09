{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-family-aws (2.2.0-r2)

# TODO: Implement crossplane-aws image
throw "Image 'crossplane-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
