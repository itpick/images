{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-agent
# Reference: https://images.chainguard.dev/directory/image/spire-agent/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.spire-agent  # spire-agent (1.13.3-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcap-utils (2.77-r0)
#   libcrypt1 (2.42-r4)

# TODO: Implement spire-agent image
throw "Image 'spire-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.spire-agent;
#   name = "spire-agent";
#   tag = "v${pkgs.spire-agent.version}";
#   entrypoint = [ "${pkgs.spire-agent}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
