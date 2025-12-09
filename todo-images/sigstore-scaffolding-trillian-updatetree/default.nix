{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-trillian-updatetree
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-trillian-updatetree/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-trillian-updatetree (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-trillian-updatetree image
throw "Image 'sigstore-scaffolding-trillian-updatetree' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-trillian-updatetree";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-trillian-updatetree";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
