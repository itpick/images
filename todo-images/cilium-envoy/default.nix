{ buildCLIImage, pkgs, lib, ... }:

# Image: cilium-envoy
# Reference: https://images.chainguard.dev/directory/image/cilium-envoy/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   cilium-envoy-1.18 (1.18.4-r1)
#   ld-linux (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement cilium-envoy image
throw "Image 'cilium-envoy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cilium-envoy";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cilium-envoy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
