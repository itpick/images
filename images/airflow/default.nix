{ mkImage, pkgs, lib, ... }:

# Apache Airflow - Programmatically author, schedule and monitor data pipelines
# https://airflow.apache.org/

mkImage {
  drv = pkgs.apache-airflow;
  name = "airflow";
  tag = pkgs.apache-airflow.version;
  entrypoint = [ "${pkgs.apache-airflow}/bin/airflow" ];
  # Was `version` (a one-shot, so the kind-test pod CrashLoops). `airflow
  # standalone` is the single-command all-in-one mode: it initialises the
  # (SQLite) metadata DB, creates an admin user, and runs the API server +
  # scheduler + dag-processor + triggerer. See env below for the writable-HOME,
  # username and bind-address settings it needs to come up as nonroot.
  cmd = [ "standalone" ];

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
    # /opt/airflow isn't writable on the read-only root; airflow writes its
    # config, SQLite DB and logs under AIRFLOW_HOME, so point it at /tmp.
    AIRFLOW_HOME = "/tmp/airflow";
    # airflow calls getpass.getuser(); the nonroot uid has no /etc/passwd entry
    # and no $USER, so it would crash ("No username set in the environment").
    USER = "airflow";
    # Bind the API server on all interfaces (reachable by the probe) and skip
    # the example DAGs for a clean, fast standalone start.
    AIRFLOW__API__HOST = "0.0.0.0";
    AIRFLOW__CORE__LOAD_EXAMPLES = "False";
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
