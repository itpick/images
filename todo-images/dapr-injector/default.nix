{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-injector
# Reference: https://images.chainguard.dev/directory/image/dapr-injector/overview

# Packages NOT in nixpkgs (need custom derivations):
#   dapr-injector-1.15 (1.15.13-r3)

# TODO: Implement dapr-injector image
throw "Image 'dapr-injector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dapr-injector";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-injector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
