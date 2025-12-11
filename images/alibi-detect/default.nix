# alibi-detect
# =============
# Alibi Detect - ML model drift and outlier detection
# https://github.com/SeldonIO/alibi-detect

{ nix2container, pkgs, lib, ... }:

# Alibi Detect provides algorithms for ML model monitoring:
# - Drift detection
# - Outlier detection
# - Adversarial detection

let
  version = "0.12.0";

  pythonEnv = pkgs.python312.withPackages (ps: with ps; [
    # Core ML libraries
    numpy
    scipy
    scikit-learn
    pandas

    # Deep learning backends
    # tensorflow  # Optional
    # torch  # Optional

    # Visualization
    matplotlib

    # API serving
    fastapi
    uvicorn
    pydantic
    requests

    # Serialization
    cloudpickle
    dill
  ]);

in
nix2container.buildImage {
  name = "alibi-detect";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "alibi-detect-root";
    paths = [
      pythonEnv

      # Additional tools
      pkgs.bash
      pkgs.coreutils
      pkgs.curl
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "alibi-detect-dirs" {} ''
        mkdir -p $out/app
        mkdir -p $out/models
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/app" "/models" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pythonEnv}/bin/python" ];
    cmd = [ "-m" "uvicorn" "app:app" "--host" "0.0.0.0" "--port" "8080" ];
    workingDir = "/app";
    exposedPorts = {
      "8080/tcp" = {};
    };
    env = [
      "MODEL_DIR=/models"
      "PYTHONUNBUFFERED=1"
    ];
    labels = {
      "org.opencontainers.image.title" = "Alibi Detect";
      "org.opencontainers.image.description" = "ML model drift and outlier detection";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "seldon";
    };
  };
}
