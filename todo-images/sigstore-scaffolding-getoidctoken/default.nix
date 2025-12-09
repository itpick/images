{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-getoidctoken
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-getoidctoken/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-getoidctoken (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-getoidctoken image
throw "Image 'sigstore-scaffolding-getoidctoken' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-getoidctoken";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-getoidctoken";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
