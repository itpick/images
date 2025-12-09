{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-trillian-createtree
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-trillian-createtree/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-trillian-createtree (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-trillian-createtree image
throw "Image 'sigstore-scaffolding-trillian-createtree' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-trillian-createtree";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-trillian-createtree";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
