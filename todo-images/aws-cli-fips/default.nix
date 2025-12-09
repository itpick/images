{ buildCLIImage, pkgs, lib, ... }:

# Image: aws-cli-fips
# Reference: https://images.chainguard.dev/directory/image/aws-cli-fips/overview

# Packages available in nixpkgs:
#   pkgs.awscli  # aws-cli-2 (2.32.10-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   groff-base (1.23.0-r7)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libstdc++ (15.2.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement aws-cli-fips image
throw "Image 'aws-cli-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.awscli;
#   name = "aws-cli-fips";
#   tag = "v${pkgs.awscli.version}";
#   entrypoint = [ "${pkgs.awscli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "aws-cli-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
