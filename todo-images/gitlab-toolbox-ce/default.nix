{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-toolbox-ce
# Reference: https://images.chainguard.dev/directory/image/gitlab-toolbox-ce/overview

# TODO: Implement gitlab-toolbox-ce image
throw "Image 'gitlab-toolbox-ce' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "gitlab-toolbox-ce";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-toolbox-ce";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
