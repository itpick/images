{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for vault:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)
#   pkgs.vault  # vault-1.21 (1.21.1-r2)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcap-utils (2.77-r0)
#   libcrypt1 (2.42-r4)

mkImage {
  drv = pkgs.vault;
  name = "vault";
  tag = pkgs.vault.version;
  entrypoint = [ "${pkgs.vault}/bin/vault" ];
  # Was `server --help` (a one-shot). Run vault in dev mode — an in-memory,
  # auto-unsealed single node — the standard runnable default (mirrors the
  # sibling consul image's `agent -dev`). Dev mode disables mlock, so no
  # IPC_LOCK capability is needed, and -dev-listen-address binds all interfaces
  # on :8200 so the vault / kind-test probe can reach it (dev defaults to
  # 127.0.0.1). Operators override with `server -config=/vault/config.hcl`.
  cmd = [ "server" "-dev" "-dev-listen-address=0.0.0.0:8200" ];

  extraPkgs = with pkgs; [ busybox dumb-init libcap su-exec ];

  env = {
    VAULT_ADDR = "http://127.0.0.1:8200";
    SKIP_SETCAP = "1";
  };

  labels = {
    "org.opencontainers.image.title" = "HashiCorp Vault";
    "org.opencontainers.image.description" = "Secrets management and data protection";
    "org.opencontainers.image.version" = pkgs.vault.version;
    "io.nix-containers.chart" = "vault";
  };
}
