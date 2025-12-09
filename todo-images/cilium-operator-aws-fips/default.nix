{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-operator-aws-fips
# Reference: https://images.chainguard.dev/directory/image/cilium-operator-aws-fips/overview

# TODO: Implement cilium-operator-aws-fips image
throw "Image 'cilium-operator-aws-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cilium-operator-aws-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-operator-aws-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
