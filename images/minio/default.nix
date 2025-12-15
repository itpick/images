{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    minio
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "minio";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "minio-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
      "MINIO_ROOT_USER=minioadmin"
      "MINIO_ROOT_PASSWORD=minioadmin"
    ];
    ExposedPorts = {
      "9000/tcp" = {};
      "9001/tcp" = {};
    };
    Entrypoint = [ "${pkgs.minio}/bin/minio" ];
    Cmd = [ "server" "/data" "--console-address" ":9001" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High Performance Object Storage";
      "org.opencontainers.image.version" = pkgs.minio.version;
      "io.nix-containers.chart" = "loki,tempo";
    };
  };
}
