{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-policy-controller-fips
# Reference: https://images.chainguard.dev/directory/image/sigstore-policy-controller-fips/overview

# TODO: Implement sigstore-policy-controller-fips image
throw "Image 'sigstore-policy-controller-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-policy-controller-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-policy-controller-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
