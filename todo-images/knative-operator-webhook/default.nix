{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-operator-webhook
# Reference: https://images.chainguard.dev/directory/image/knative-operator-webhook/overview

# Packages NOT in nixpkgs (need custom derivations):
#   knative-operator-1.19-webhook (1.19.5-r1)

# TODO: Implement knative-operator-webhook image
throw "Image 'knative-operator-webhook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "knative-operator-webhook";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-operator-webhook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
