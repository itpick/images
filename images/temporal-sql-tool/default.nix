{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-sql-tool
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
  name = "temporal-sql-tool";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "temporal-sql-tool-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "temporal sql tool";
      "org.opencontainers.image.description" = "temporal-sql-tool container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
