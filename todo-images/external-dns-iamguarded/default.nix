{ buildCLIImage, pkgs, lib, ... }:

# Image: external-dns-iamguarded
# Reference: https://images.chainguard.dev/directory/image/external-dns-iamguarded/overview

# TODO: Implement external-dns-iamguarded image
throw "Image 'external-dns-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "external-dns-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "external-dns-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
