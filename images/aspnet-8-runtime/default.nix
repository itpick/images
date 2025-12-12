{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aspnet-8-runtime
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
  name = "aspnet-8-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "aspnet-8-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "aspnet 8 runtime";
      "org.opencontainers.image.description" = "aspnet-8-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
