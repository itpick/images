{ buildCLIImage, pkgs, lib, ... }:

# Image: zig
# Reference: https://images.chainguard.dev/directory/image/zig/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-20 (20.1.8-r5)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.zig  # zig (0.15.2-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libclang-cpp-20 (20.1.8-r5)
#   libcrypt1 (2.42-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement zig image
throw "Image 'zig' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.zig;
#   name = "zig";
#   tag = "v${pkgs.zig.version}";
#   entrypoint = [ "${pkgs.zig}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "zig";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
