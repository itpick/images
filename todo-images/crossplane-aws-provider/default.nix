{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-provider
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-provider/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-aws-provider (0.56.0-r3)

# TODO: Implement crossplane-aws-provider image
throw "Image 'crossplane-aws-provider' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-provider";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-provider";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
