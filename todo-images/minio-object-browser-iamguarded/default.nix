{ buildCLIImage, pkgs, lib, ... }:

# Image: minio-object-browser-iamguarded
# Reference: https://images.chainguard.dev/directory/image/minio-object-browser-iamguarded/overview

# Packages NOT in nixpkgs (need custom derivations):
#   minio-object-browser (2.0.4-r3)

# TODO: Implement minio-object-browser-iamguarded image
throw "Image 'minio-object-browser-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "minio-object-browser-iamguarded";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "minio-object-browser-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
