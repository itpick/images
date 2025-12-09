{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-logging-operator-node-exporter
# Reference: https://images.chainguard.dev/directory/image/kube-logging-operator-node-exporter/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.prometheus-node-exporter  # prometheus-node-exporter (1.10.2-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-logging-operator-custom-runner (0.13.0-r3)
#   kube-logging-operator-node-exporter (6.2.1-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement kube-logging-operator-node-exporter image
throw "Image 'kube-logging-operator-node-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kube-logging-operator-node-exporter";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-logging-operator-node-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
