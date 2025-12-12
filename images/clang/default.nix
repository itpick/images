{ mkImage, pkgs, lib, ... }:

# Clang - C/C++ compiler from LLVM
# https://clang.llvm.org/

mkImage {
  drv = pkgs.clang;
  name = "clang";
  tag = "v${pkgs.clang.version}";
  entrypoint = [ "${pkgs.clang}/bin/clang" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Clang";
    "org.opencontainers.image.description" = "C language family compiler from LLVM";
    "org.opencontainers.image.version" = pkgs.clang.version;
  };
}
