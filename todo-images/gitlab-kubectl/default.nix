{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-kubectl
# Reference: https://images.chainguard.dev/directory/image/gitlab-kubectl/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.yq  # yq (4.49.2-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   kubectl-1.34-default (1.34.2-r3)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-keygen (10.2_p1-r2)

# TODO: Implement gitlab-kubectl image
throw "Image 'gitlab-kubectl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.gawk;
#   name = "gitlab-kubectl";
#   tag = "v${pkgs.gawk.version}";
#   entrypoint = [ "${pkgs.gawk}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-kubectl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
