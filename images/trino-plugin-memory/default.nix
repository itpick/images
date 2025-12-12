{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trino-plugin-memory
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
  name = "trino-plugin-memory";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trino-plugin-memory-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trino plugin memory";
      "org.opencontainers.image.description" = "trino-plugin-memory container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
