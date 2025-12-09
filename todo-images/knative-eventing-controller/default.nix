{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-controller
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-controller (1.19.8-r2)

# TODO: Implement knative-eventing-controller image
throw "Image 'knative-eventing-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
