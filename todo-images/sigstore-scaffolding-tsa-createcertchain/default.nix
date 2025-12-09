{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-tsa-createcertchain
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-tsa-createcertchain/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-tsa-createcertchain (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-tsa-createcertchain image
throw "Image 'sigstore-scaffolding-tsa-createcertchain' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-tsa-createcertchain";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-tsa-createcertchain";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
