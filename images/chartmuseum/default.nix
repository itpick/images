{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# chartmuseum
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
  name = "chartmuseum";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "chartmuseum-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "chartmuseum";
      "org.opencontainers.image.description" = "chartmuseum container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
