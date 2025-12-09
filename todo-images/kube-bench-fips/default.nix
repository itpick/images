{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-bench-fips
# Reference: https://images.chainguard.dev/directory/image/kube-bench-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.procps  # procps (4.0.5-r42)

# Packages NOT in nixpkgs (need custom derivations):
#   kube-bench-configs (0.14.0-r1)
#   kube-bench-fips (0.14.0-r2)
#   kubectl-fips-1.34 (1.34.2-r1)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libproc-2-0 (4.0.5-r42)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement kube-bench-fips image
throw "Image 'kube-bench-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kube-bench-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-bench-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
