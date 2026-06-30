{ mkImage, pkgs, lib, ... }:

# OpenBao - Secrets management (Vault fork)
# https://openbao.org/

mkImage {
  drv = pkgs.openbao;
  name = "openbao";
  tag = "v${pkgs.openbao.version}";
  entrypoint = [ "${pkgs.openbao}/bin/bao" ];
  # Was `version` (a one-shot, so the kind-test pod CrashLoops). Run OpenBao in
  # dev mode — an in-memory, auto-unsealed server (no storage backend, init or
  # unseal-key handling needed), with -dev-listen-address binding 0.0.0.0:8200
  # so the kind-test probe can reach the API (dev mode otherwise binds only
  # 127.0.0.1). Operators override with `server -config=/openbao/config.hcl`.
  cmd = [ "server" "-dev" "-dev-listen-address=0.0.0.0:8200" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenBao";
    "org.opencontainers.image.description" = "Community-driven fork of Vault for secrets management";
    "org.opencontainers.image.version" = pkgs.openbao.version;
  };
}
