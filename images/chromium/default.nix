{ mkImage, pkgs, lib, ... }:

# Chromium - Open-source web browser
# https://www.chromium.org/

mkImage {
  drv = pkgs.chromium;
  name = "chromium";
  tag = "v${pkgs.chromium.version}";
  entrypoint = [ "${pkgs.chromium}/bin/chromium" ];
  cmd = [ "--headless" "--disable-gpu" "--no-sandbox" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Chromium";
    "org.opencontainers.image.description" = "Open-source web browser";
    "org.opencontainers.image.version" = pkgs.chromium.version;
  };
}
