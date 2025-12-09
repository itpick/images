{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-arangodb
# Reference: https://images.chainguard.dev/directory/image/kube-arangodb/overview

# Packages available in nixpkgs:
#   pkgs.envoy  # envoy-1.36 (1.36.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-arangodb-1.3 (1.3.3-r0)
#   ld-linux (2.42-r4)

# TODO: Implement kube-arangodb image
throw "Image 'kube-arangodb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.envoy;
#   name = "kube-arangodb";
#   tag = "v${pkgs.envoy.version}";
#   entrypoint = [ "${pkgs.envoy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-arangodb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
