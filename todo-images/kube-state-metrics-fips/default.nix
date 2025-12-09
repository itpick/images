{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-state-metrics-fips
# Reference: https://images.chainguard.dev/directory/image/kube-state-metrics-fips/overview

# TODO: Implement kube-state-metrics-fips image
throw "Image 'kube-state-metrics-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-state-metrics-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-state-metrics-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
