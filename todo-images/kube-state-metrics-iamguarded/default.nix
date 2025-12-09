{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-state-metrics-iamguarded
# Reference: https://images.chainguard.dev/directory/image/kube-state-metrics-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.kube-state-metrics  # kube-state-metrics (2.17.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)

# TODO: Implement kube-state-metrics-iamguarded image
throw "Image 'kube-state-metrics-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kube-state-metrics;
#   name = "kube-state-metrics-iamguarded";
#   tag = "v${pkgs.kube-state-metrics.version}";
#   entrypoint = [ "${pkgs.kube-state-metrics}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-state-metrics-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
