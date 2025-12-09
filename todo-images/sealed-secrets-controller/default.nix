{ buildCLIImage, pkgs, lib, ... }:

# Image: sealed-secrets-controller
# Reference: https://images.chainguard.dev/directory/image/sealed-secrets-controller/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sealed-secrets (0.33.1-r2)

# TODO: Implement sealed-secrets-controller image
throw "Image 'sealed-secrets-controller' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sealed-secrets-controller";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "sealed-secrets-controller";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
