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

  # Match upstream vaultwarden/server image defaults. Without these
  # the rust binary's own defaults take over and the server binds to
  # 127.0.0.1 (loopback only), so any k8s probe / Service traffic
  # hitting the pod IP gets refused and the chart's liveness/
  # readiness probes kill the pod. We don't carry ROCKET_PORT=80 from
  # upstream because (a) the chart already sets ROCKET_PORT to its
  # service port (8080 for our HelmRelease) and (b) <1024 binds would
  # fail under the nonRoot user we set below.
  env = {
    WEB_VAULT_FOLDER = "${pkgs.vaultwarden-webvault}/share/vaultwarden/vault";
    ROCKET_ADDRESS = "0.0.0.0";
    ROCKET_PROFILE = "release";
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
