{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-eventing-webhook
# Reference: https://images.chainguard.dev/directory/image/knative-eventing-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-eventing-1.19-webhook (1.19.8-r1)

# TODO: Implement knative-eventing-webhook image
throw "Image 'knative-eventing-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-eventing-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-eventing-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
