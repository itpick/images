{ mkImage, pkgs, nonRoot, ... }:

# Vaultwarden - Unofficial Bitwarden-compatible server written in Rust
# https://github.com/dani-garcia/vaultwarden

mkImage {
  drv = pkgs.vaultwarden;
  name = "vaultwarden";
  tag = "v${pkgs.vaultwarden.version}";
  entrypoint = [ "${pkgs.vaultwarden}/bin/vaultwarden" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
    sqlite
  ];

  labels = {
    "org.opencontainers.image.title" = "Vaultwarden";
    "org.opencontainers.image.description" = "Unofficial Bitwarden-compatible server written in Rust";
    "org.opencontainers.image.version" = pkgs.vaultwarden.version;
    "io.nix-containers.image.upstream" = "https://github.com/dani-garcia/vaultwarden";
    "io.nix-containers.image.category" = "security";
    "io.nix-containers.image.aliases" = "vaultwarden,bitwarden,password-manager";
  };

  user = nonRoot.userString;
}
