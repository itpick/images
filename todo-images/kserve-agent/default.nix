{ buildCLIImage, pkgs, lib, ... }:

# Image: kserve-agent
# Reference: https://images.chainguard.dev/directory/image/kserve-agent/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kserve-agent (0.16.0-r2)

# TODO: Implement kserve-agent image
throw "Image 'kserve-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kserve-agent";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kserve-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
