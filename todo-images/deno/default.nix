{ buildCLIImage, pkgs, lib, ... }:

# Image: deno
# Reference: https://images.chainguard.dev/directory/image/deno/overview

# Packages available in nixpkgs:
#   pkgs.deno  # deno (2.5.6-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement deno image
throw "Image 'deno' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.deno;
#   name = "deno";
#   tag = "v${pkgs.deno.version}";
#   entrypoint = [ "${pkgs.deno}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "deno";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
