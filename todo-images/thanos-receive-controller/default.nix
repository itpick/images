{ buildCLIImage, pkgs, lib, ... }:

# Image: thanos-receive-controller
# Reference: https://images.chainguard.dev/directory/image/thanos-receive-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   thanos-receive-controller (0_git20251112-r2)

# TODO: Implement thanos-receive-controller image
throw "Image 'thanos-receive-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "thanos-receive-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "thanos-receive-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
