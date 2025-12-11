# explainer-dashboard
# =============
# Explainer Dashboard - ML model explainability dashboard
# https://github.com/oegedijk/explainerdashboard

{ nix2container, pkgs, lib, ... }:

# Explainer Dashboard provides interactive dashboards for ML model explanation

let
  version = "0.4.3";

  pythonEnv = pkgs.python312.withPackages (ps: with ps; [
    # Core ML libraries
    numpy
    pandas
    scikit-learn

    # Explainability
    shap

    # Dashboard framework
    dash
    plotly
    flask

    # ML model support
    joblib

    # Data handling
    pyyaml
  ]);

in
nix2container.buildImage {
  name = "explainer-dashboard";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "explainer-dashboard-root";
    paths = [
      pythonEnv

      # Additional tools
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "explainer-dashboard-dirs" {} ''
        mkdir -p $out/app
        mkdir -p $out/models
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/app" "/models" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pythonEnv}/bin/python" ];
    cmd = [ "-m" "explainerdashboard" "run" "dashboard.yaml" ];
    workingDir = "/app";
    exposedPorts = {
      "8050/tcp" = {};
    };
    env = [
      "MODEL_DIR=/models"
      "PYTHONUNBUFFERED=1"
    ];
    labels = {
      "org.opencontainers.image.title" = "Explainer Dashboard";
      "org.opencontainers.image.description" = "ML model explainability dashboard";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "explainer";
    };
  };
}
