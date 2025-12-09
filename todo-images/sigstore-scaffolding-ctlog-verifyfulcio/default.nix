{ buildCLIImage, pkgs, lib, ... }:

# Image: sigstore-scaffolding-ctlog-verifyfulcio
# Reference: https://images.chainguard.dev/directory/image/sigstore-scaffolding-ctlog-verifyfulcio/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sigstore-scaffolding-ctlog-verifyfulcio (0.7.31-r2)

# TODO: Implement sigstore-scaffolding-ctlog-verifyfulcio image
throw "Image 'sigstore-scaffolding-ctlog-verifyfulcio' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sigstore-scaffolding-ctlog-verifyfulcio";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sigstore-scaffolding-ctlog-verifyfulcio";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
