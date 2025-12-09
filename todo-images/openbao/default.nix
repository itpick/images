{ buildCLIImage, pkgs, lib, ... }:

# Image: openbao
# Reference: https://images.chainguard.dev/directory/image/openbao/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.openbao  # openbao (2.4.4-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcap-utils (2.77-r0)
#   libcrypt1 (2.42-r4)

# TODO: Implement openbao image
throw "Image 'openbao' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.openbao;
#   name = "openbao";
#   tag = "v${pkgs.openbao.version}";
#   entrypoint = [ "${pkgs.openbao}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "openbao";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
