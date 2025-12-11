# atlantis
# =============
# Atlantis - Terraform Pull Request Automation
# https://www.runatlantis.io/
#
# Atlantis automates Terraform via pull requests. It enables GitOps
# for infrastructure changes.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.atlantis;
  name = "atlantis";
  tag = "v${pkgs.atlantis.version}";
  entrypoint = [ "${pkgs.atlantis}/bin/atlantis" ];
  cmd = [ "server" ];

  extraPkgs = with pkgs; [
    bash
    git
    openssh
    terraform
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Atlantis";
    "org.opencontainers.image.description" = "Terraform Pull Request Automation";
    "org.opencontainers.image.version" = pkgs.atlantis.version;
  };
}
