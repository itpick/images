{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aspnet-10-targeting-pack
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
  name = "aspnet-10-targeting-pack";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "aspnet-10-targeting-pack-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "aspnet 10 targeting pack";
      "org.opencontainers.image.description" = "aspnet-10-targeting-pack container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
