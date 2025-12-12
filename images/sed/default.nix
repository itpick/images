{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sed
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
  name = "sed";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sed-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sed";
      "org.opencontainers.image.description" = "sed container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
