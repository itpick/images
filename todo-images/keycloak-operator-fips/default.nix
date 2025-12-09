{ buildCLIImage, pkgs, lib, ... }:

# Image: keycloak-operator-fips
# Reference: https://images.chainguard.dev/directory/image/keycloak-operator-fips/overview

# TODO: Implement keycloak-operator-fips image
throw "Image 'keycloak-operator-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "keycloak-operator-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "keycloak-operator-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
