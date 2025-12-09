{ buildCLIImage, pkgs, lib, ... }:

# Image: cyberark-secrets-provider-for-k8s-fips
# Reference: https://images.chainguard.dev/directory/image/cyberark-secrets-provider-for-k8s-fips/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   cyberark-secrets-provider-for-k8s-fips (1.7.7-r1)
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cyberark-secrets-provider-for-k8s-fips image
throw "Image 'cyberark-secrets-provider-for-k8s-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "cyberark-secrets-provider-for-k8s-fips";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "777";
#
#   labels = {
#     "org.opencontainers.image.title" = "cyberark-secrets-provider-for-k8s-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
