{ buildCLIImage, pkgs, lib, ... }:

# Image: openbao-fips
# Reference: https://images.chainguard.dev/directory/image/openbao-fips/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcap-utils (2.77-r0)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openbao-fips (2.4.4-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement openbao-fips image
throw "Image 'openbao-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dumb-init;
#   name = "openbao-fips";
#   tag = "v${pkgs.dumb-init.version}";
#   entrypoint = [ "${pkgs.dumb-init}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "openbao-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
