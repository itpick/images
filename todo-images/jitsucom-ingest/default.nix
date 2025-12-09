{ buildCLIImage, pkgs, lib, ... }:

# Image: jitsucom-ingest
# Reference: https://images.chainguard.dev/directory/image/jitsucom-ingest/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   jitsucom-bulker-ingest (2.11.913-r2)
#   ld-linux (2.42-r4)

# TODO: Implement jitsucom-ingest image
throw "Image 'jitsucom-ingest' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "jitsucom-ingest";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "jitsucom-ingest";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
