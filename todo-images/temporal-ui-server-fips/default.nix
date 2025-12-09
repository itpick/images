{ buildCLIImage, pkgs, lib, ... }:

# Image: temporal-ui-server-fips
# Reference: https://images.chainguard.dev/directory/image/temporal-ui-server-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   dockerize-fips (0.9.8-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   temporal-ui-server-fips (2.43.3-r2)
#   temporal-ui-server-oci-entrypoint (2.43.3-r2)

# TODO: Implement temporal-ui-server-fips image
throw "Image 'temporal-ui-server-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "temporal-ui-server-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "temporal-ui-server-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
