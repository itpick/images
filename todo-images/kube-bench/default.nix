{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-bench
# Reference: https://images.chainguard.dev/directory/image/kube-bench/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kube-bench  # kube-bench (0.14.0-r1)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.procps  # procps (4.0.5-r42)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-bench-configs (0.14.0-r1)
#   kubectl-1.34-default (1.34.2-r2)
#   ld-linux (2.42-r4)
#   libproc-2-0 (4.0.5-r42)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement kube-bench image
throw "Image 'kube-bench' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kube-bench;
#   name = "kube-bench";
#   tag = "v${pkgs.kube-bench.version}";
#   entrypoint = [ "${pkgs.kube-bench}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-bench";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
