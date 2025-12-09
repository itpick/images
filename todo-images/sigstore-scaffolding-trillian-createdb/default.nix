{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-trillian-createdb
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-trillian-createdb/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-trillian-createdb (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-trillian-createdb image
throw "Image 'sigstore-scaffolding-trillian-createdb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-trillian-createdb";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-trillian-createdb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
