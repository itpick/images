{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-cli-iamguarded-fips
# Reference: https://images.chainguard.dev/directory/image/aws-cli-iamguarded-fips/overview

# Packages available in nixpkgs:
#   pkgs.awscli  # aws-cli-2 (2.32.11-r0)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   groff-base (1.23.0-r7)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement aws-cli-iamguarded-fips image
throw "Image 'aws-cli-iamguarded-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.awscli;
#   name = "aws-cli-iamguarded-fips";
#   tag = "v${pkgs.awscli.version}";
#   entrypoint = [ "${pkgs.awscli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-cli-iamguarded-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
