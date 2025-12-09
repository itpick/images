{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-tuf-createsecret
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-tuf-createsecret/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-tuf-createsecret (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-tuf-createsecret image
throw "Image 'sigstore-scaffolding-tuf-createsecret' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-tuf-createsecret";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-tuf-createsecret";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
