{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-dashboard-metrics-scraper
# Reference: https://images.chainguard.dev/directory/image/kubernetes-dashboard-metrics-scraper/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-dashboard-metrics-scraper (1.2.2-r14)

# TODO: Implement kubernetes-dashboard-metrics-scraper image
throw "Image 'kubernetes-dashboard-metrics-scraper' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-dashboard-metrics-scraper";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-dashboard-metrics-scraper";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
