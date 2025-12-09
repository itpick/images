{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-route53
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-route53/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-route53 (2.2.0-r2)

# TODO: Implement crossplane-aws-route53 image
throw "Image 'crossplane-aws-route53' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-route53";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-route53";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
