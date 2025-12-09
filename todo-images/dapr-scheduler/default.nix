{ buildCLIImage, pkgs, lib, ... }:

# Image: dapr-scheduler
# Reference: https://images.chainguard.dev/directory/image/dapr-scheduler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   dapr-scheduler-1.15 (1.15.13-r3)

# TODO: Implement dapr-scheduler image
throw "Image 'dapr-scheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "dapr-scheduler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dapr-scheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
