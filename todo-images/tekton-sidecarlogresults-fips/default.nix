{ buildCLIImage, pkgs, lib, ... }:

# Image: tekton-sidecarlogresults-fips
# Reference: https://images.chainguard.dev/directory/image/tekton-sidecarlogresults-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   tekton-pipelines-sidecarlogresults-fips-1.5 (1.5.0-r2)

# TODO: Implement tekton-sidecarlogresults-fips image
throw "Image 'tekton-sidecarlogresults-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "tekton-sidecarlogresults-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "tekton-sidecarlogresults-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
