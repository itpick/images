{ buildCLIImage, pkgs, lib, ... }:

# Image: jitsucom-bulker
# Reference: https://images.chainguard.dev/directory/image/jitsucom-bulker/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   jitsucom-bulker-bulker (2.11.913-r2)
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement jitsucom-bulker image
throw "Image 'jitsucom-bulker' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "jitsucom-bulker";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jitsucom-bulker";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
