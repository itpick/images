{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-cni-plugin
# Reference: https://images.chainguard.dev/directory/image/linkerd-cni-plugin/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.inotify-tools  # inotify-tools (4.25.9.0-r0)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.procps  # procps (4.0.5-r42)

# Packages NOT in nixpkgs (need custom derivations):
#   inotify-tools-libs (4.25.9.0-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libproc-2-0 (4.0.5-r42)
#   linkerd2-cni-plugin (1.6.4-r5)
#   linkerd2-cni-repair-controller (1.6.4-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement linkerd-cni-plugin image
throw "Image 'linkerd-cni-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "linkerd-cni-plugin";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-cni-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
