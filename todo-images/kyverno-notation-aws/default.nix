{ buildCLIImage, pkgs, lib, ... }:

# Image: kyverno-notation-aws
# Reference: https://images.chainguard.dev/directory/image/kyverno-notation-aws/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   aws-signer-notation-plugin (1.0.2292-r4)
#   kyverno-notation-aws (1.1-r25)
#   ld-linux (2.42-r4)

# TODO: Implement kyverno-notation-aws image
throw "Image 'kyverno-notation-aws' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "kyverno-notation-aws";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kyverno-notation-aws";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
