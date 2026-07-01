{ mkImage, pkgs, lib, ... }:

# mlflow-nixchart
# ===============
# MLflow tracking server from nixpkgs' python313.pkgs.mlflow-server.
# Paired with charts/mlflow. The chart supplies MLFLOW_BACKEND_STORE_URI
# (points at postgres by default) and MLFLOW_DEFAULT_ARTIFACT_ROOT (S3).

let
  mlflow = pkgs.mlflow-server;
  entrypoint = pkgs.writeShellScript "mlflow-entrypoint" ''
    set -e
    exec ${lib.getExe mlflow} server \
      --host "''${MLFLOW_HOST:-0.0.0.0}" \
      --port "''${MLFLOW_PORT:-5000}" \
      "$@"
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "mlflow-nixchart-env";
    paths = [ mlflow pkgs.bash pkgs.coreutils pkgs.cacert ];
  };
  name = "mlflow-nixchart";
  tag = "v${mlflow.version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "mlflow-nixchart";
    "org.opencontainers.image.description" = "MLflow tracking server for charts/mlflow";
    "org.opencontainers.image.version" = mlflow.version;
    "io.nix-containers.chart" = "mlflow";
  };
}
