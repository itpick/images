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

  # Spark writes its scratch/local dirs + the JVM temp under /tmp, but buildEnv
  # leaves /tmp a read-only store symlink — declare a real writable /tmp (1777)
  # in its own layer (same approach as the nginx/hugo images).
  writableDirs = pkgs.runCommand "spark-writable-dirs" { } ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "spark";
  tag = pkgs.spark.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "spark-root";
          paths = base.basePackages ++ sparkPackages ++ [ userEnv ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    # The bare image had no Cmd → the kind-test pod fails with "no command
    # specified". Run a standalone Spark master in the foreground (spark-class
    # runs java in the foreground and logs to the console); it binds the master
    # RPC on 0.0.0.0:7077 and the web UI on 8080, and stays up waiting for
    # workers to register. Operators run workers with
    # `spark-class org.apache.spark.deploy.worker.Worker spark://<master>:7077`.
    Entrypoint = [ "${pkgs.spark}/bin/spark-class" ];
    Cmd = [
      "org.apache.spark.deploy.master.Master"
      "--host"
      "0.0.0.0"
      "--port"
      "7077"
      "--webui-port"
      "8080"
    ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath sparkPackages}:${pkgs.spark}/bin"
      "SPARK_HOME=${pkgs.spark}"
      "JAVA_HOME=${pkgs.openjdk21}"
      # Keep Spark's scratch + the JVM temp on the writable /tmp.
      "SPARK_LOCAL_DIRS=/tmp"
      "HOME=/tmp"
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
