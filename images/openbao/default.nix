{ mkImage, pkgs, lib, ... }:

# OpenBao - Secrets management (Vault fork)
# https://openbao.org/

mkImage {
  drv = pkgs.openbao;
  name = "openbao";
  tag = "v${pkgs.openbao.version}";
  entrypoint = [ "${pkgs.openbao}/bin/bao" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "OpenBao";
    "org.opencontainers.image.description" = "Community-driven fork of Vault for secrets management";
    "org.opencontainers.image.version" = pkgs.openbao.version;
  };
}
