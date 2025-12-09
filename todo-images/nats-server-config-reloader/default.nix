{ buildCLIImage, pkgs, lib, ... }:

# Image: nats-server-config-reloader
# Reference: https://images.chainguard.dev/directory/image/nats-server-config-reloader/overview

# Packages available in nixpkgs:
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   nats-server-config-reloader (0.21.1-r0)
#   nats-server-config-reloader-oci-entrypoint (0.21.1-r0)

# TODO: Implement nats-server-config-reloader image
throw "Image 'nats-server-config-reloader' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "nats-server-config-reloader";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nats-server-config-reloader";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
