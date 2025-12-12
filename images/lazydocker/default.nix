{ mkImage, pkgs, lib, ... }:

# lazydocker - Docker terminal UI
# https://github.com/jesseduffield/lazydocker

mkImage {
  drv = pkgs.lazydocker;
  name = "lazydocker";
  tag = "v${pkgs.lazydocker.version}";
  entrypoint = [ "${pkgs.lazydocker}/bin/lazydocker" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "lazydocker";
    "org.opencontainers.image.description" = "Terminal UI for Docker and docker-compose";
    "org.opencontainers.image.version" = pkgs.lazydocker.version;
  };
}
