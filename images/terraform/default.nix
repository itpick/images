# terraform
# =============
# Terraform - Infrastructure as Code
# https://www.terraform.io/
#
# Terraform is an infrastructure as code tool that lets you build,
# change, and version cloud and on-prem resources safely.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.terraform;
  name = "terraform";
  tag = "v${pkgs.terraform.version}";
  entrypoint = [ "${pkgs.terraform}/bin/terraform" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    git
    openssh
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Terraform";
    "org.opencontainers.image.description" = "Infrastructure as Code tool";
    "org.opencontainers.image.version" = pkgs.terraform.version;
  };
}
