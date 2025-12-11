{ mkImage, pkgs, lib, ... }:

# PyPy - Fast alternative Python implementation
# https://www.pypy.org/

mkImage {
  drv = pkgs.pypy;
  name = "pypy";
  tag = "v${pkgs.pypy.version}";
  entrypoint = [ "${pkgs.pypy}/bin/pypy" ];
  cmd = [ "--version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "PyPy";
    "org.opencontainers.image.description" = "Fast alternative Python implementation";
    "org.opencontainers.image.version" = pkgs.pypy.version;
  };
}
