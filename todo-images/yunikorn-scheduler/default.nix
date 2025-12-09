{ buildCLIImage, pkgs, lib, ... }:

# Image: yunikorn-scheduler
# Reference: https://images.chainguard.dev/directory/image/yunikorn-scheduler/overview

# Packages NOT in nixpkgs (need custom derivations):
#   yunikorn-k8shim (1.7.0-r6)

# TODO: Implement yunikorn-scheduler image
throw "Image 'yunikorn-scheduler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "yunikorn-scheduler";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "4444";
#
#   labels = {
#     "org.opencontainers.image.title" = "yunikorn-scheduler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
