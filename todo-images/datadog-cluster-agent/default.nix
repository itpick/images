{ buildCLIImage, pkgs, lib, ... }:

# Image: datadog-cluster-agent
# Reference: https://images.chainguard.dev/directory/image/datadog-cluster-agent/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   datadog-cluster-agent (7.72.4-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement datadog-cluster-agent image
throw "Image 'datadog-cluster-agent' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.findutils;
#   name = "datadog-cluster-agent";
#   tag = "v${pkgs.findutils.version}";
#   entrypoint = [ "${pkgs.findutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "datadog-cluster-agent";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
