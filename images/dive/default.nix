{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  divePackages = with pkgs; [
    dive
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "dive";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "dive-root";
      paths = base.basePackages ++ divePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath divePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Tool for exploring a docker image, layer contents, and discovering ways to shrink size";
    };
  };
}