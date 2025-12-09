{ buildCLIImage, pkgs, lib, ... }:

# Image: metricbeat
# Reference: https://images.chainguard.dev/directory/image/metricbeat/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.metricbeat  # metricbeat-9.2 (9.2.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   metricbeat-9.2-oci-entrypoint (9.2.2-r2)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sed (4.9-r6)

# TODO: Implement metricbeat image
throw "Image 'metricbeat' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.metricbeat;
#   name = "metricbeat";
#   tag = "v${pkgs.metricbeat.version}";
#   entrypoint = [ "${pkgs.metricbeat}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "metricbeat";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
