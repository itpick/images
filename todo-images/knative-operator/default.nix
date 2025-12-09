{ buildCLIImage, pkgs, lib, ... }:

# Image: knative-operator
# Reference: https://images.chainguard.dev/directory/image/knative-operator/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   knative-operator-1.19 (1.19.5-r1)

# TODO: Implement knative-operator image
throw "Image 'knative-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "knative-operator";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "knative-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
