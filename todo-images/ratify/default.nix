{ buildCLIImage, pkgs, lib, ... }:

# Image: ratify
# Reference: https://images.chainguard.dev/directory/image/ratify/overview

# Packages NOT in nixpkgs (need custom derivations):
#   ratify (1.4.0-r8)
#   ratify-licensechecker (1.4.0-r8)
#   ratify-sbom (1.4.0-r8)
#   ratify-schemavalidator (1.4.0-r8)
#   ratify-vulnerabilityreport (1.4.0-r8)

# TODO: Implement ratify image
throw "Image 'ratify' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ratify";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ratify";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
