{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-metrics-scraper-fips
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-metrics-scraper-fips/overview

# TODO: Implement kubernetes-dashboard-metrics-scraper-fips image
throw "Image 'kubernetes-dashboard-metrics-scraper-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-dashboard-metrics-scraper-fips";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-metrics-scraper-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
