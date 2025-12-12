{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm-nvvs
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
  name = "dcgm-nvvs";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dcgm-nvvs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm nvvs";
      "org.opencontainers.image.description" = "dcgm-nvvs container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
