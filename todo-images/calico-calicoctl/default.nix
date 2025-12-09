{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-calicoctl
# Reference: https://images.chainguard.dev/directory/image/calico-calicoctl/overview

# Packages available in nixpkgs:
#   pkgs.calicoctl  # calicoctl-3.31 (3.31.2-r3)

# TODO: Implement calico-calicoctl image
throw "Image 'calico-calicoctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.calicoctl;
#   name = "calico-calicoctl";
#   tag = "v${pkgs.calicoctl.version}";
#   entrypoint = [ "${pkgs.calicoctl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-calicoctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
