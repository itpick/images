{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  waitForItPackages = with pkgs; [
    wait4x
    bash
    coreutils
    netcat-gnu
    curl
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "wait-for-it";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "wait-for-it-root";
      paths = base.basePackages ++ waitForItPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath waitForItPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Wait for service dependencies before starting";
    };
  };
}