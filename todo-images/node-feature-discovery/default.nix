{ buildCLIImage, pkgs, lib, ... }:

# Image: node-feature-discovery
# Reference: https://images.chainguard.dev/directory/image/node-feature-discovery/overview

# Packages NOT in nixpkgs (need custom derivations):
#   node-feature-discovery-0.18 (0.18.3-r3)

# TODO: Implement node-feature-discovery image
throw "Image 'node-feature-discovery' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "node-feature-discovery";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "node-feature-discovery";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
