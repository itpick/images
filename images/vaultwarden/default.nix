{ mkImage, pkgs, nonRoot, ... }:

# Vaultwarden - Unofficial Bitwarden-compatible server written in Rust
# https://github.com/dani-garcia/vaultwarden

mkImage {
  drv = pkgs.vaultwarden;
  name = "vaultwarden";
  tag = "v${pkgs.vaultwarden.version}";
  entrypoint = [ "${pkgs.vaultwarden}/bin/vaultwarden" ];
  cmd = [];

  # Upstream vaultwarden/server ships the binary AND the static
  # web-vault frontend in the same image (chart default
  # WEB_VAULT_ENABLED=true requires it). nixpkgs splits the two into
  # separate derivations (pkgs.vaultwarden = rust binary,
  # pkgs.vaultwarden-webvault = npm-built static assets at
  # share/vaultwarden/vault), so we bundle both layers and point the
  # binary at the assets via WEB_VAULT_FOLDER.
  extraPkgs = with pkgs; [
    cacert
    sqlite
    vaultwarden-webvault
  ];

  env = {
    WEB_VAULT_FOLDER = "${pkgs.vaultwarden-webvault}/share/vaultwarden/vault";
  };

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
