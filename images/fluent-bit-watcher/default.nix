{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-bit-watcher
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
  name = "fluent-bit-watcher";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "fluent-bit-watcher-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluent-bit-watcher";
      "org.opencontainers.image.description" = "fluent-bit-watcher container image";
    };
  };
}
