{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-ec2
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-ec2/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-ec2 (2.2.0-r2)

# TODO: Implement crossplane-aws-ec2 image
throw "Image 'crossplane-aws-ec2' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-ec2";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-ec2";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
