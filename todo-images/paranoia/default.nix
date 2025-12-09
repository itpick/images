{ buildCLIImage, pkgs, lib, ... }:

# Image: paranoia
# Reference: https://images.chainguard.dev/directory/image/paranoia/overview

# Packages available in nixpkgs:
#   pkgs.libcdio-paranoia  # paranoia (0.5.0-r1)

# TODO: Implement paranoia image
throw "Image 'paranoia' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.libcdio-paranoia;
#   name = "paranoia";
#   tag = "v${pkgs.libcdio-paranoia.version}";
#   entrypoint = [ "${pkgs.libcdio-paranoia}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "paranoia";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
