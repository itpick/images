{ buildCLIImage, pkgs, lib, ... }:

# Image: rekor-backfill-index
# Reference: https://images.chainguard.dev/directory/image/rekor-backfill-index/overview

# Packages NOT in nixpkgs (need custom derivations):
#   rekor-backfill-index (1.4.3-r1)

# TODO: Implement rekor-backfill-index image
throw "Image 'rekor-backfill-index' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "rekor-backfill-index";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rekor-backfill-index";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
