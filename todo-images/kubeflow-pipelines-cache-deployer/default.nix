{ buildCLIImage, pkgs, lib, ... }:

# Image: kubeflow-pipelines-cache-deployer
# Reference: https://images.chainguard.dev/directory/image/kubeflow-pipelines-cache-deployer/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-latest (0-r11)
#   kubeflow-pipelines-cache-deployer (2.15.0-r1)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement kubeflow-pipelines-cache-deployer image
throw "Image 'kubeflow-pipelines-cache-deployer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kubeflow-pipelines-cache-deployer";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubeflow-pipelines-cache-deployer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
