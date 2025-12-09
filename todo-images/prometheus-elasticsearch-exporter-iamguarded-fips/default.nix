{ buildCLIImage, pkgs, lib, ... }:

# Image: prometheus-elasticsearch-exporter-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/prometheus-elasticsearch-exporter-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   prometheus-elasticsearch-exporter-fips (1.9.0-r11)

# TODO: Implement prometheus-elasticsearch-exporter-iamguarded-fips image
throw "Image 'prometheus-elasticsearch-exporter-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "prometheus-elasticsearch-exporter-iamguarded-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prometheus-elasticsearch-exporter-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
