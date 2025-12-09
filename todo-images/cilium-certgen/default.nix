{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-certgen
# Reference: https://images.chainguard.dev/directory/image/cilium-certgen/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-certgen-0.2 (0.2.4-r5)

# TODO: Implement cilium-certgen image
throw "Image 'cilium-certgen' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cilium-certgen";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-certgen";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
