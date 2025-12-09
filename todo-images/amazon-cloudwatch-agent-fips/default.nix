{ buildCLIImage, pkgs, lib, ... }:

# Image: amazon-cloudwatch-agent-fips
# Reference: https://images.chainguard.dev/directory/image/amazon-cloudwatch-agent-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   amazon-cloudwatch-agent-amazon-cloudwatch-agent-config-wizard-fips (1.300062.0-r2)
#   amazon-cloudwatch-agent-config-downloader-fips (1.300062.0-r2)
#   amazon-cloudwatch-agent-config-translator-fips (1.300062.0-r2)
#   amazon-cloudwatch-agent-fips (1.300062.0-r2)
#   amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-fips (1.300062.0-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement amazon-cloudwatch-agent-fips image
throw "Image 'amazon-cloudwatch-agent-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "amazon-cloudwatch-agent-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "amazon-cloudwatch-agent-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
