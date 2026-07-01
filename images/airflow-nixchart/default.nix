{ mkImage, pkgs, lib, ... }:

# airflow-nixchart
# ================
# Apache Airflow 3.x from nixpkgs, paired with charts/airflow. The chart
# runs several airflow subcommands in different pods (scheduler,
# webserver, worker, triggerer); each container overrides `cmd` — the
# entrypoint just forwards to the airflow CLI.
#
# The chart supplies AIRFLOW__CORE__SQL_ALCHEMY_CONN (postgres) and
# AIRFLOW__CELERY__BROKER_URL (redis).

mkImage {
  drv = pkgs.buildEnv {
    name = "airflow-nixchart-env";
    paths = [ pkgs.apache-airflow pkgs.bash pkgs.coreutils pkgs.cacert ];
  };
  name = "airflow-nixchart";
  tag = "v${pkgs.apache-airflow.version}";
  entrypoint = [ (lib.getExe pkgs.apache-airflow) ];
  # Default to `standalone` — chart pods always override with the
  # concrete role (scheduler / api-server / worker / triggerer).
  cmd = [ "standalone" ];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "airflow-nixchart";
    "org.opencontainers.image.description" = "Apache Airflow for charts/airflow";
    "org.opencontainers.image.version" = pkgs.apache-airflow.version;
    "io.nix-containers.chart" = "airflow";
  };
}
