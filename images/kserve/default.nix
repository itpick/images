# kserve
# =============
# KServe - Serverless ML Inference Platform on Kubernetes
# https://github.com/kserve/kserve

{ nix2container, pkgs, lib, ... }:

# KServe is a standardized serverless ML inference platform on Kubernetes

let
  version = "0.16.0";

  pythonEnv = pkgs.python312.withPackages (ps: with ps; [
    kserve
    numpy
    pandas
    scikit-learn
    requests
    grpcio
    protobuf
    uvicorn
    fastapi
  ]);

in
nix2container.buildImage {
  name = "kserve";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "kserve-root";
    paths = [
      pythonEnv

      # Additional tools
      pkgs.cacert
      pkgs.curl
      pkgs.bash
      pkgs.coreutils

      # Create directories
      (pkgs.runCommand "kserve-dirs" {} ''
        mkdir -p $out/kserve
        mkdir -p $out/mnt/models
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/kserve" "/mnt" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pythonEnv}/bin/python" ];
    cmd = [ "-m" "kserve" ];
    workingDir = "/kserve";
    exposedPorts = {
      "8080/tcp" = {};
      "8081/tcp" = {};
    };
    env = [
      "MODEL_DIR=/mnt/models"
      "PYTHONUNBUFFERED=1"
    ];
    labels = {
      "org.opencontainers.image.title" = "KServe";
      "org.opencontainers.image.description" = "Serverless ML Inference Platform on Kubernetes";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "kserve";
    };
  };
}
