{ buildCLIImage, pkgs, lib, ... }:

# Image: jitsucom-syncctl
# Reference: https://images.chainguard.dev/directory/image/jitsucom-syncctl/overview

# Packages NOT in nixpkgs (need custom derivations):
#   jitsucom-bulker-syncctl (2.11.913-r2)

# TODO: Implement jitsucom-syncctl image
throw "Image 'jitsucom-syncctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "jitsucom-syncctl";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jitsucom-syncctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
