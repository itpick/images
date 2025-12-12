{ mkImage, pkgs, lib, ... }:

# Apache Airflow - Programmatically author, schedule and monitor data pipelines
# https://airflow.apache.org/

mkImage {
  drv = pkgs.apache-airflow;
  name = "airflow";
  tag = pkgs.apache-airflow.version;
  entrypoint = [ "${pkgs.apache-airflow}/bin/airflow" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [
    cacert
    tzdata
    bash
    coreutils
    curl
    git
    graphviz  # For DAG visualization
  ];

  env = {
    AIRFLOW_HOME = "/opt/airflow";
  };

  # Airflow typically runs as non-root user 50000
  user = "50000:0";

  labels = {
    "org.opencontainers.image.title" = "Apache Airflow";
    "org.opencontainers.image.description" = "Platform to programmatically author, schedule and monitor workflows";
    "org.opencontainers.image.version" = pkgs.apache-airflow.version;
    "io.nix-containers.chart" = "airflow";
  };
}
