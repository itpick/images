{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-system-upgrade-controller
# Reference: https://images.chainguard.dev/directory/image/rancher-system-upgrade-controller/overview

# Packages available in nixpkgs:
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   rancher-system-upgrade-controller (0.18.0-r1)

# TODO: Implement rancher-system-upgrade-controller image
throw "Image 'rancher-system-upgrade-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.tzdata;
#   name = "rancher-system-upgrade-controller";
#   tag = "v${pkgs.tzdata.version}";
#   entrypoint = [ "${pkgs.tzdata}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65534";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-system-upgrade-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
