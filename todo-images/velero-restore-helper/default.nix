{ buildCLIImage, pkgs, lib, ... }:

# Image: velero-restore-helper
# Reference: https://images.chainguard.dev/directory/image/velero-restore-helper/overview

# Packages available in nixpkgs:
#   pkgs.restic  # restic (0.18.1-r3)
#   pkgs.velero  # velero (1.17.1-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   velero-restore-helper (1.17.1-r2)

# TODO: Implement velero-restore-helper image
throw "Image 'velero-restore-helper' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.restic;
#   name = "velero-restore-helper";
#   tag = "v${pkgs.restic.version}";
#   entrypoint = [ "${pkgs.restic}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "velero-restore-helper";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
