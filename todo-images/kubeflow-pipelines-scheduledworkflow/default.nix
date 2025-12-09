{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pipelines-scheduledworkflow
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pipelines-scheduledworkflow/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   kubeflow-pipelines-scheduledworkflow (2.15.0-r1)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement kubeflow-pipelines-scheduledworkflow image
throw "Image 'kubeflow-pipelines-scheduledworkflow' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubeflow-pipelines-scheduledworkflow";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pipelines-scheduledworkflow";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
