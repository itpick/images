{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spdx-tools-java
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "spdx-tools-java";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "spdx-tools-java-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spdx tools java";
      "org.opencontainers.image.description" = "spdx-tools-java container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
