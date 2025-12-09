{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-tuf-server
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-tuf-server/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-tuf-server (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-tuf-server image
throw "Image 'sigstore-scaffolding-tuf-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-tuf-server";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-tuf-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
