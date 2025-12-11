{ mkImage, pkgs, lib, ... }:

# PyPI Server - Minimal PyPI server
# https://github.com/pypiserver/pypiserver

mkImage {
  drv = pkgs.pypiserver;
  name = "pypiserver";
  tag = "v${pkgs.pypiserver.version}";
  entrypoint = [ "${pkgs.pypiserver}/bin/pypi-server" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "PyPI Server";
    "org.opencontainers.image.description" = "Minimal PyPI-compatible server";
    "org.opencontainers.image.version" = pkgs.pypiserver.version;
  };
}
