{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# scanner-test
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "scanner-test";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "scanner-test-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "scanner-test";
      "org.opencontainers.image.description" = "scanner-test container image";
    };
  };
}
