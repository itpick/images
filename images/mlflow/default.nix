{ mkImage, pkgs, lib, ... }:

let
  version = "2.21.3";

  # MLflow from nixpkgs python packages
  mlflow = pkgs.python3Packages.mlflow;

in
mkImage {
  drv = mlflow;
  name = "mlflow";
  tag = version;
  entrypoint = [ "${mlflow}/bin/mlflow" ];
  cmd = [ "server" ];

  # Note: Don't include python3 in extraPkgs as it conflicts with cacert's setup-hook
  # mlflow already brings in python through its dependencies
  extraPkgs = with pkgs; [
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "MLflow";
    "org.opencontainers.image.description" = "ML lifecycle management platform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "mlflow";
  };
}
