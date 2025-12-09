{ buildCLIImage, pkgs, lib, ... }:

# Image: seaweedfs-fips
# Reference: https://images.chainguard.dev/directory/image/seaweedfs-fips/overview

# Packages available in nixpkgs:
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.fuse2  # fuse2 (2.9.9-r53)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.su-exec  # su-exec (0.3-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   seaweedfs-fips (4.01-r1)
#   seaweedfs-fips-oci-entrypoint (4.01-r1)

# TODO: Implement seaweedfs-fips image
throw "Image 'seaweedfs-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "seaweedfs-fips";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "seaweedfs-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
