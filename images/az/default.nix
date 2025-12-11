{ mkImage, pkgs, lib, ... }:

# Azure CLI - Command line interface for Microsoft Azure
# https://docs.microsoft.com/en-us/cli/azure/

mkImage {
  drv = pkgs.azure-cli;
  name = "az";
  tag = "v${pkgs.azure-cli.version}";
  entrypoint = [ "${pkgs.azure-cli}/bin/az" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Azure CLI";
    "org.opencontainers.image.description" = "Command line interface for Microsoft Azure";
    "org.opencontainers.image.version" = pkgs.azure-cli.version;
  };
}
