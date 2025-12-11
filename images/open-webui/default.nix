{ mkImage, pkgs, lib, ... }:

# Open WebUI - User-friendly web interface for LLMs
# https://openwebui.com/

mkImage {
  drv = pkgs.open-webui;
  name = "open-webui";
  tag = "v${pkgs.open-webui.version}";
  entrypoint = [ "${pkgs.open-webui}/bin/open-webui" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Open WebUI";
    "org.opencontainers.image.description" = "User-friendly web interface for LLMs";
    "org.opencontainers.image.version" = pkgs.open-webui.version;
  };
}
