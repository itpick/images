{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  staticPackages = with pkgs.pkgsStatic; [
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "static";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "static-root";
      paths = staticPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath staticPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Statically linked base image with essential tools";
    };
  };
}