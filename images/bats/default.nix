{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    bats
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "bats";
  tag = "v${pkgs.bats.version}";

  copyToRoot = [
    (buildEnv {
      name = "bats-root";
      paths = base.basePackages ++ packages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
    ];
    Entrypoint = [ "${pkgs.bats}/bin/bats" ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Bash Automated Testing System";
      "org.opencontainers.image.version" = pkgs.bats.version;
      "io.nix-containers.chart" = "kube-prometheus-stack,kyverno";
    };
  };
}
