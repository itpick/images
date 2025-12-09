{ buildCLIImage, pkgs, lib, ... }:

# Image: promtail
# Reference: https://images.chainguard.dev/directory/image/promtail/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libsystemd (258.2-r3)
#   loki-3.6-promtail (3.6.2-r0)

# TODO: Implement promtail image
throw "Image 'promtail' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "promtail";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "promtail";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
