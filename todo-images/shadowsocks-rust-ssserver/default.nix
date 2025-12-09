{ buildCLIImage, pkgs, lib, ... }:

# Image: shadowsocks-rust-ssserver
# Reference: https://images.chainguard.dev/directory/image/shadowsocks-rust-ssserver/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.shadowsocks-rust  # shadowsocks-rust (1.23.5-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   shadowsocks-rust-ssserver (1.23.5-r3)

# TODO: Implement shadowsocks-rust-ssserver image
throw "Image 'shadowsocks-rust-ssserver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "shadowsocks-rust-ssserver";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "shadowsocks-rust-ssserver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
