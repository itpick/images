{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  koPackages = with pkgs; [
    ko
    go
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "ko";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "ko-root";
      paths = base.basePackages ++ koPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath koPackages}"
      "GOPATH=/home/nonroot/go"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Build and deploy Go applications on Kubernetes";
    };
  };
}