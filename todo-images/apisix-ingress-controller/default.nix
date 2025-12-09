{ buildCLIImage, pkgs, lib, ... }:

# Image: apisix-ingress-controller
# Reference: https://images.chainguard.dev/directory/image/apisix-ingress-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   apisix-ingress-controller (1.8.4-r7)

# TODO: Implement apisix-ingress-controller image
throw "Image 'apisix-ingress-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "apisix-ingress-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "apisix-ingress-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
