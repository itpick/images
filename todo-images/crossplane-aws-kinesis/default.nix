{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-aws-kinesis
# Reference: https://images.chainguard.dev/directory/image/crossplane-aws-kinesis/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-aws-kinesis (2.2.0-r2)

# TODO: Implement crossplane-aws-kinesis image
throw "Image 'crossplane-aws-kinesis' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-aws-kinesis";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-aws-kinesis";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
