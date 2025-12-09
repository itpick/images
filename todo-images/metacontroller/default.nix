{ buildCLIImage, pkgs, lib, ... }:

# Image: metacontroller
# Reference: https://images.chainguard.dev/directory/image/metacontroller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   metacontroller (4.12.5-r2)

# TODO: Implement metacontroller image
throw "Image 'metacontroller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "metacontroller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "metacontroller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
