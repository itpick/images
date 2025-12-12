{ mkImage, pkgs, lib, ... }:

# OpenVSCode Server - VS Code in the browser
# https://github.com/gitpod-io/openvscode-server

mkImage {
  drv = pkgs.openvscode-server;
  name = "openvscode-server";
  tag = "v${pkgs.openvscode-server.version}";
  entrypoint = [ "${pkgs.openvscode-server}/bin/openvscode-server" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenVSCode Server";
    "org.opencontainers.image.description" = "VS Code in the browser";
    "org.opencontainers.image.version" = pkgs.openvscode-server.version;
  };
}
