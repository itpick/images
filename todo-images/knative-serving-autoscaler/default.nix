{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-serving-autoscaler
# Reference: https://images.chainguard.dev/directory/image/knative-serving-autoscaler/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-serving-1.19-autoscaler (1.19.7-r2)

# TODO: Implement knative-serving-autoscaler image
throw "Image 'knative-serving-autoscaler' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "knative-serving-autoscaler";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-serving-autoscaler";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
