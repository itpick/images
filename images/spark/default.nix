# spark
# =============
# Apache Spark - Unified analytics engine for large-scale data processing
# https://spark.apache.org/

{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  sparkPackages = with pkgs; [
    spark
    openjdk21
    bash
    coreutils
    procps
    python3
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "spark";
  tag = pkgs.spark.version;

  copyToRoot = [
    (buildEnv {
      name = "spark-root";
      paths = base.basePackages ++ sparkPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath sparkPackages}:${pkgs.spark}/bin"
      "SPARK_HOME=${pkgs.spark}"
      "JAVA_HOME=${pkgs.openjdk21}"
    ];
    ExposedPorts = {
      "4040/tcp" = {};  # Spark UI
      "7077/tcp" = {};  # Spark master
      "8080/tcp" = {};  # Spark master web UI
      "8081/tcp" = {};  # Spark worker web UI
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Apache Spark - Unified analytics engine for large-scale data processing";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.spark.version;
      "io.nix-containers.image.upstream" = "https://spark.apache.org/";
      "io.nix-containers.image.category" = "data-processing";
      "io.nix-containers.image.aliases" = "spark,apache-spark,data";
    };
  };
}
