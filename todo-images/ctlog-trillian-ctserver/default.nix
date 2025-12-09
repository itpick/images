{ buildCLIImage, pkgs, lib, ... }:

# Image: ctlog-trillian-ctserver
# Reference: https://images.chainguard.dev/directory/image/ctlog-trillian-ctserver/overview

# Packages NOT in nixpkgs (need custom derivations):
#   certificate-transparency-trillian-ctserver (1.3.2-r6)

# TODO: Implement ctlog-trillian-ctserver image
throw "Image 'ctlog-trillian-ctserver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "ctlog-trillian-ctserver";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ctlog-trillian-ctserver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
