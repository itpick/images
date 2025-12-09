{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-cli-fips
# Reference: https://images.chainguard.dev/directory/image/kyverno-cli-fips/overview

# TODO: Implement kyverno-cli-fips image
throw "Image 'kyverno-cli-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kyverno-cli-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-cli-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
