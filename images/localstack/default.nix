{ mkImage, pkgs, lib, ... }:

# LocalStack - Local AWS cloud stack
# https://localstack.cloud/

mkImage {
  drv = pkgs.localstack;
  name = "localstack";
  tag = "v${pkgs.localstack.version}";
  entrypoint = [ "${pkgs.localstack}/bin/localstack" ];
  cmd = [ "start" ];

  extraPkgs = with pkgs; [ cacert python3 docker ];

  labels = {
    "org.opencontainers.image.title" = "LocalStack";
    "org.opencontainers.image.description" = "Local AWS cloud stack for development and testing";
    "org.opencontainers.image.version" = pkgs.localstack.version;
  };
}
