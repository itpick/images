{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# py3-cassandra-medusa - Apache Cassandra backup and restore tool
# Python-based backup tool for Apache Cassandra

let
  pythonPackages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.setuptools
    python3Packages.wheel
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "py3-cassandra-medusa";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "py3-cassandra-medusa-root";
      paths = base.basePackages ++ pythonPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath pythonPackages}"
      "PYTHONPATH=/home/nonroot/.local/lib/python3.12/site-packages"
      "PIP_USER=1"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "py3-cassandra-medusa";
      "org.opencontainers.image.description" = "Apache Cassandra backup and restore tool";
    };
  };
}
