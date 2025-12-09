{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy-fips
# Reference: https://images.chainguard.dev/directory/image/envoy-fips/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   boringssl-fips-static-2023042800-tools (2023042800-r6)
#   envoy-1.36-config (1.36.3-r0)
#   envoy-1.36-oci-entrypoint (1.36.3-r0)
#   envoy-fips-1.36 (1.36.3-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement envoy-fips image
throw "Image 'envoy-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "envoy-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
