{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    memcached
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "memcached";
  tag = pkgs.memcached.version;

  copyToRoot = [
    (buildEnv {
      name = "memcached-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
    ];
    ExposedPorts = {
      "11211/tcp" = {};
    };
    Entrypoint = [ "${pkgs.memcached}/bin/memcached" ];
    Cmd = [ "-u" "nobody" ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "High performance distributed memory object caching system";
      "org.opencontainers.image.version" = pkgs.memcached.version;
      "io.nix-containers.chart" = "loki";
    };
  };
}
