{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-cloudsqlproxy
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-cloudsqlproxy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cloud-sql-proxy-2.18 (2.18.3-r2)
#   sigstore-scaffolding-cloudsqlproxy (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-cloudsqlproxy image
throw "Image 'sigstore-scaffolding-cloudsqlproxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-cloudsqlproxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-cloudsqlproxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
