{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-eks
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-eks/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-eks (2.2.0-r2)

# TODO: Implement crossplane-aws-eks image
throw "Image 'crossplane-aws-eks' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-eks";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-eks";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
