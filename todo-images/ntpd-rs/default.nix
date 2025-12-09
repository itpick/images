{ buildCLIImage, pkgs, lib, ... }:

# Image: ntpd-rs
# Reference: https://images.chainguard.dev/directory/image/ntpd-rs/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ntpd-rs  # ntpd-rs (1.6.2-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement ntpd-rs image
throw "Image 'ntpd-rs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.ntpd-rs;
#   name = "ntpd-rs";
#   tag = "v${pkgs.ntpd-rs.version}";
#   entrypoint = [ "${pkgs.ntpd-rs}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ntpd-rs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
