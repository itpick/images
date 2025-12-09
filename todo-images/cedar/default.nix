{ buildCLIImage, pkgs, lib, ... }:

# Image: cedar
# Reference: https://images.chainguard.dev/directory/image/cedar/overview

# Packages available in nixpkgs:
#   pkgs.cedar  # cedar (4.8.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cedar image
throw "Image 'cedar' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cedar;
#   name = "cedar";
#   tag = "v${pkgs.cedar.version}";
#   entrypoint = [ "${pkgs.cedar}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cedar";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
