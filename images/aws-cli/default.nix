{ mkImage, pkgs, lib, ... }:

# AWS CLI v2 - Command line interface for Amazon Web Services
# https://aws.amazon.com/cli/

mkImage {
  drv = pkgs.awscli2;
  name = "aws-cli";
  tag = "v${pkgs.awscli2.version}";
  entrypoint = [ "${pkgs.awscli2}/bin/aws" ];
  cmd = [ "--version" ];

  extraPkgs = with pkgs; [ cacert groff ];

  labels = {
    "org.opencontainers.image.title" = "AWS CLI";
    "org.opencontainers.image.description" = "Universal Command Line Interface for Amazon Web Services";
    "org.opencontainers.image.version" = pkgs.awscli2.version;
  };
}
