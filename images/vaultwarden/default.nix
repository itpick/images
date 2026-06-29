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
  # readiness probes kill the pod.
  #
  # ROCKET_PORT: vaultwarden's own default is the privileged :80, which the
  # nonRoot user below can't bind — the bare image would CrashLoop. Default to
  # 8080 (>1024) so it runs standalone; the chart still overrides this with its
  # service port via the PodSpec env.
  # DATA_FOLDER: vaultwarden's default is ./data, relative to the read-only
  # nix-store cwd — it can't create its SQLite DB / RSA keys there. Point it at
  # the writable /tmp; operators mount a PVC and override DATA_FOLDER.
  env = {
    WEB_VAULT_FOLDER = "${pkgs.vaultwarden-webvault}/share/vaultwarden/vault";
    ROCKET_ADDRESS = "0.0.0.0";
    ROCKET_PORT = "8080";
    ROCKET_PROFILE = "release";
    DATA_FOLDER = "/tmp/vaultwarden";
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
