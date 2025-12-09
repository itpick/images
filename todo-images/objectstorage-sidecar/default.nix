{ buildCLIImage, pkgs, lib, ... }:

# Image: objectstorage-sidecar
# Reference: https://images.chainguard.dev/directory/image/objectstorage-sidecar/overview

# Packages NOT in nixpkgs (need custom derivations):
#   container-object-storage-interface-sidecar (0.2.1-r3)

# TODO: Implement objectstorage-sidecar image
throw "Image 'objectstorage-sidecar' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "objectstorage-sidecar";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "objectstorage-sidecar";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
