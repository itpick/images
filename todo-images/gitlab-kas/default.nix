{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-kas
# Reference: https://images.chainguard.dev/directory/image/gitlab-kas/overview

# Packages NOT in nixpkgs (need custom derivations):
#   gitlab-kas-18.6 (18.6.1-r1)

# TODO: Implement gitlab-kas image
throw "Image 'gitlab-kas' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gitlab-kas";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-kas";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
