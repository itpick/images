{ buildCLIImage, pkgs, lib, ... }:

# Image: mongodb-kubernetes-operator-version-upgrade-post-start-hook
# Reference: https://images.chainguard.dev/directory/image/mongodb-kubernetes-operator-version-upgrade-post-start-hook/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   mongodb-kubernetes-operator-version-upgrade-post-start-hook (0.13.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement mongodb-kubernetes-operator-version-upgrade-post-start-hook image
throw "Image 'mongodb-kubernetes-operator-version-upgrade-post-start-hook' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "mongodb-kubernetes-operator-version-upgrade-post-start-hook";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mongodb-kubernetes-operator-version-upgrade-post-start-hook";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
