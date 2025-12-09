{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-serving-controller
# Reference: https://images.chainguard.dev/directory/image/knative-serving-controller/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-serving-1.19-controller (1.19.7-r2)

# TODO: Implement knative-serving-controller image
throw "Image 'knative-serving-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "knative-serving-controller";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-serving-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
