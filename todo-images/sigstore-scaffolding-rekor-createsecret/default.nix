{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-rekor-createsecret
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-rekor-createsecret/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-rekor-createsecret (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-rekor-createsecret image
throw "Image 'sigstore-scaffolding-rekor-createsecret' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-rekor-createsecret";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-rekor-createsecret";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
