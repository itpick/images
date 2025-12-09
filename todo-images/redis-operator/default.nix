{ buildCLIImage, pkgs, lib, ... }:

# Image: redis-operator
# Reference: https://images.chainguard.dev/directory/image/redis-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   redis-operator (0.22.2-r1)

# TODO: Implement redis-operator image
throw "Image 'redis-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "redis-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "redis-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
