{ buildCLIImage, pkgs, lib, ... }:

# Image: skopeo
# Reference: https://images.chainguard.dev/directory/image/skopeo/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.skopeo  # skopeo (1.21.0-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   containers-common (0.64.1-r0)
#   containers-image (5.36.1-r0)
#   containers-shortnames (0_git20250724-r0)
#   containers-skopeo-config (1.19.0-r0)
#   containers-storage (1.59.1-r0)
#   ld-linux (2.42-r4)

# TODO: Implement skopeo image
throw "Image 'skopeo' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.skopeo;
#   name = "skopeo";
#   tag = "v${pkgs.skopeo.version}";
#   entrypoint = [ "${pkgs.skopeo}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "skopeo";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
