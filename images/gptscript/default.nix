{ mkImage, pkgs, lib, ... }:

# GPTScript - Natural language programming
# https://gptscript.ai/

mkImage {
  drv = pkgs.gptscript;
  name = "gptscript";
  tag = "v${pkgs.gptscript.version}";
  entrypoint = [ "${pkgs.gptscript}/bin/gptscript" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "GPTScript";
    "org.opencontainers.image.description" = "Natural language programming framework";
    "org.opencontainers.image.version" = pkgs.gptscript.version;
  };
}
