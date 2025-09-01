{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  glibcPackages = with pkgs; [
    glibc
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "glibc-dynamic";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "glibc-dynamic-root";
      paths = base.basePackages ++ glibcPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath glibcPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Dynamically linked glibc base image";
    };
  };
}