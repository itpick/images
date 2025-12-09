{ buildCLIImage, pkgs, lib, ... }:

# Image: bazel
# Reference: https://images.chainguard.dev/directory/image/bazel/overview

# TODO: Implement bazel image
throw "Image 'bazel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "bazel";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "bazel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
