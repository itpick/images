{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-sigv4-proxy
# Reference: https://images.chainguard.dev/directory/image/aws-sigv4-proxy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   aws-sigv4-proxy (1.10-r4)

# TODO: Implement aws-sigv4-proxy image
throw "Image 'aws-sigv4-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "aws-sigv4-proxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-sigv4-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
