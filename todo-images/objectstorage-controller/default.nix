{ buildCLIImage, pkgs, lib, ... }:

# Image: objectstorage-controller
# Reference: https://images.chainguard.dev/directory/image/objectstorage-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   container-object-storage-interface-controller (0.2.1-r3)

# TODO: Implement objectstorage-controller image
throw "Image 'objectstorage-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "objectstorage-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "objectstorage-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
