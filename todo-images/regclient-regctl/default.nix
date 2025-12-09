{ buildCLIImage, pkgs, lib, ... }:

# Image: regclient-regctl
# Reference: https://images.chainguard.dev/directory/image/regclient-regctl/overview

# Packages NOT in nixpkgs (need custom derivations):
#   regclient-regctl (0.11.0-r0)

# TODO: Implement regclient-regctl image
throw "Image 'regclient-regctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "regclient-regctl";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "regclient-regctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
