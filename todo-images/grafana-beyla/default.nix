{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-beyla
# Reference: https://images.chainguard.dev/directory/image/grafana-beyla/overview

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-beyla (2.7.9-r1)

# TODO: Implement grafana-beyla image
throw "Image 'grafana-beyla' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "grafana-beyla";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-beyla";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
