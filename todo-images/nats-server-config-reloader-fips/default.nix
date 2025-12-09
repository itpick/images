{ buildCLIImage, pkgs, lib, ... }:

# Image: nats-server-config-reloader-fips
# Reference: https://images.chainguard.dev/directory/image/nats-server-config-reloader-fips/overview

# Packages available in nixpkgs:
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   nats-server-config-reloader-fips (0.21.1-r0)
#   nats-server-config-reloader-oci-entrypoint (0.21.1-r0)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement nats-server-config-reloader-fips image
throw "Image 'nats-server-config-reloader-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "nats-server-config-reloader-fips";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nats-server-config-reloader-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
