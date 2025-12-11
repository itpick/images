{ mkImage, pkgs, lib, ... }:

# Ollama - Run large language models locally
# https://ollama.ai/

mkImage {
  drv = pkgs.ollama;
  name = "ollama";
  tag = "v${pkgs.ollama.version}";
  entrypoint = [ "${pkgs.ollama}/bin/ollama" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Ollama";
    "org.opencontainers.image.description" = "Get up and running with large language models locally";
    "org.opencontainers.image.version" = pkgs.ollama.version;
  };
}
