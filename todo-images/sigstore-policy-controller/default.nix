{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-policy-controller
# Reference: https://images.chainguard.dev/directory/image/sigstore-policy-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   policy-controller (0.13.1-r3)

# TODO: Implement sigstore-policy-controller image
throw "Image 'sigstore-policy-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-policy-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-policy-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
