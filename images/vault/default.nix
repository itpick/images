{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.vault;
  name = "vault";
  tag = pkgs.vault.version;
  entrypoint = [ "${pkgs.vault}/bin/vault" ];
  cmd = [ "server" "--help" ];

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
