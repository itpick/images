{ buildCLIImage, pkgs, lib, ... }:

# Image: secretgen-controller
# Reference: https://images.chainguard.dev/directory/image/secretgen-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   secretgen-controller (0.20.0-r1)

# TODO: Implement secretgen-controller image
throw "Image 'secretgen-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "secretgen-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "secretgen-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
