{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-ctlog-createctconfig
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-ctlog-createctconfig/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-ctlog-createctconfig (0.7.31-r1)

# TODO: Implement sigstore-scaffolding-ctlog-createctconfig image
throw "Image 'sigstore-scaffolding-ctlog-createctconfig' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-ctlog-createctconfig";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-ctlog-createctconfig";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
