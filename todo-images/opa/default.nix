{ buildCLIImage, pkgs, lib, ... }:

# Image: opa
# Reference: https://images.chainguard.dev/directory/image/opa/overview

# Packages available in nixpkgs:
#   pkgs.opa-envoy-plugin  # opa (1.11.0-r1)

# TODO: Implement opa image
throw "Image 'opa' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.opa-envoy-plugin;
#   name = "opa";
#   tag = "v${pkgs.opa-envoy-plugin.version}";
#   entrypoint = [ "${pkgs.opa-envoy-plugin}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opa";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
