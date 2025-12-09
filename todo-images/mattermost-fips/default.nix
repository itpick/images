{ buildCLIImage, pkgs, lib, ... }:

# Image: mattermost-fips
# Reference: https://images.chainguard.dev/directory/image/mattermost-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   mattermost-fips-11.1 (11.1.1-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement mattermost-fips image
throw "Image 'mattermost-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "mattermost-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "mattermost-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
