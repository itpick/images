{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    zookeeper
    bash
    coreutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "zookeeper";
  tag = pkgs.zookeeper.version;

  copyToRoot = [
    (buildEnv {
      name = "zookeeper-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}:${pkgs.zookeeper}/bin"
      "ZOO_DATA_DIR=/data"
      "ZOO_LOG_DIR=/logs"
      "ZOOCFGDIR=${pkgs.zookeeper}/conf"
    ];
    ExposedPorts = {
      "2181/tcp" = {};
      "2888/tcp" = {};
      "3888/tcp" = {};
    };
    Entrypoint = [ "${pkgs.zookeeper}/bin/zkServer.sh" ];
    Cmd = [ "start-foreground" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Apache ZooKeeper distributed coordination service";
      "org.opencontainers.image.version" = pkgs.zookeeper.version;
      "io.nix-containers.chart" = "apache-nifi";
    };
  };
}
