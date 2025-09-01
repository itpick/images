{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  cranePackages = with pkgs; [
    crane
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "crane";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "crane-root";
      paths = base.basePackages ++ cranePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cranePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Tool for interacting with remote images and registries";
    };
  };
}