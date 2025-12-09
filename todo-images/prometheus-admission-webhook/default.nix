{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-admission-webhook
# Reference: https://images.chainguard.dev/directory/image/prometheus-admission-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   prometheus-admission-webhook (0.87.0-r2)

# TODO: Implement prometheus-admission-webhook image
throw "Image 'prometheus-admission-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "prometheus-admission-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-admission-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
