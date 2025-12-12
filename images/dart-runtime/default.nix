{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dart-runtime
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
  name = "dart-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dart-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dart runtime";
      "org.opencontainers.image.description" = "dart-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
