{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# graalvm-native
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
  name = "graalvm-native";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "graalvm-native-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "graalvm-native";
      "org.opencontainers.image.description" = "graalvm-native container image";
    };
  };
}
