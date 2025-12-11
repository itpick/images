# kubeflow-notebooks
# =============
# Kubeflow Notebooks - Jupyter notebooks for Kubeflow
# https://github.com/kubeflow/kubeflow

{ nix2container, pkgs, lib, ... }:

# Kubeflow Notebooks provides Jupyter notebook environments for ML workflows

let
  version = "1.9.0";

  pythonEnv = pkgs.python312.withPackages (ps: with ps; [
    # Core Jupyter packages
    jupyterlab
    notebook
    ipykernel
    ipywidgets

    # ML libraries
    numpy
    pandas
    scikit-learn
    matplotlib
    seaborn

    # Deep learning (optional, can be added)
    # tensorflow
    # torch

    # Data handling
    requests
    pyyaml
    kubernetes
  ]);

in
nix2container.buildImage {
  name = "kubeflow-notebooks";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "kubeflow-notebooks-root";
    paths = [
      pythonEnv

      # Additional tools
      pkgs.bash
      pkgs.coreutils
      pkgs.curl
      pkgs.git
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "kubeflow-notebooks-dirs" {} ''
        mkdir -p $out/home/jovyan
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/home" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pythonEnv}/bin/jupyter" ];
    cmd = [ "lab" "--ip=0.0.0.0" "--port=8888" "--no-browser" "--allow-root" "--notebook-dir=/home/jovyan" ];
    workingDir = "/home/jovyan";
    exposedPorts = {
      "8888/tcp" = {};
    };
    env = [
      "HOME=/home/jovyan"
      "PYTHONUNBUFFERED=1"
      "JUPYTER_ENABLE_LAB=yes"
    ];
    labels = {
      "org.opencontainers.image.title" = "Kubeflow Notebooks";
      "org.opencontainers.image.description" = "Jupyter notebooks for Kubeflow";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "kubeflow";
    };
  };
}
