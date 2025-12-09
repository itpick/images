{ buildCLIImage, pkgs, lib, ... }:

# Image: grafana-alloy-fips
# Reference: https://images.chainguard.dev/directory/image/grafana-alloy-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   grafana-alloy-fips (1.12.0-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement grafana-alloy-fips image
throw "Image 'grafana-alloy-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "grafana-alloy-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "473";
#
#   labels = {
#     "org.opencontainers.image.title" = "grafana-alloy-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
