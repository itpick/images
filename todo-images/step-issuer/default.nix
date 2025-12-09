{ buildCLIImage, pkgs, lib, ... }:

# Image: step-issuer
# Reference: https://images.chainguard.dev/directory/image/step-issuer/overview

# Packages NOT in nixpkgs (need custom derivations):
#   step-issuer (0.9.11-r0)

# TODO: Implement step-issuer image
throw "Image 'step-issuer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "step-issuer";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "step-issuer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
