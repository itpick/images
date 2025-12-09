{ buildCLIImage, pkgs, lib, ... }:

# Image: pushprox
# Reference: https://images.chainguard.dev/directory/image/pushprox/overview

# Packages NOT in nixpkgs (need custom derivations):
#   pushprox (0.2.0-r4)
#   pushprox-client (0.2.0-r4)

# TODO: Implement pushprox image
throw "Image 'pushprox' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "pushprox";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "pushprox";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
