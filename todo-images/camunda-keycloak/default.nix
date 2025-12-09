{ buildCLIImage, pkgs, lib, ... }:

# Image: camunda-keycloak
# Reference: https://images.chainguard.dev/directory/image/camunda-keycloak/overview

# TODO: Implement camunda-keycloak image
throw "Image 'camunda-keycloak' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "camunda-keycloak";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "camunda-keycloak";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
