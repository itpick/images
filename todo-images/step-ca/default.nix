{ buildCLIImage, pkgs, lib, ... }:

# Image: step-ca
# Reference: https://images.chainguard.dev/directory/image/step-ca/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.pcsclite  # pcsc-lite (2.4.0-r0)
#   pkgs.step-cli  # step (0.29.0-r0)
#   pkgs.step-ca  # step-ca (0.29.0-r0)
#   pkgs.step-kms-plugin  # step-kms-plugin (0.15.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement step-ca image
throw "Image 'step-ca' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.step-ca;
#   name = "step-ca";
#   tag = "v${pkgs.step-ca.version}";
#   entrypoint = [ "${pkgs.step-ca}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "step-ca";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
