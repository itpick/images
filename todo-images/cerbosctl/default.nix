{ buildCLIImage, pkgs, lib, ... }:

# Image: cerbosctl
# Reference: https://images.chainguard.dev/directory/image/cerbosctl/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cerbosctl (0.48.0-r1)

# TODO: Implement cerbosctl image
throw "Image 'cerbosctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cerbosctl";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cerbosctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
