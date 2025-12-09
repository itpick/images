{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-prometheus-configurator
# Reference: https://images.chainguard.dev/directory/image/newrelic-prometheus-configurator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   newrelic-prometheus-configurator (2.4.2-r1)

# TODO: Implement newrelic-prometheus-configurator image
throw "Image 'newrelic-prometheus-configurator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "newrelic-prometheus-configurator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-prometheus-configurator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
