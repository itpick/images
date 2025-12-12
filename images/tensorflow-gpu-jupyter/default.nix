{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tensorflow-gpu-jupyter
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
  name = "tensorflow-gpu-jupyter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tensorflow-gpu-jupyter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tensorflow gpu jupyter";
      "org.opencontainers.image.description" = "tensorflow-gpu-jupyter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
