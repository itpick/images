{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aspnet-9-runtime
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
  name = "aspnet-9-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "aspnet-9-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "aspnet 9 runtime";
      "org.opencontainers.image.description" = "aspnet-9-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
