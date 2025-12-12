{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# headlamp-plugin-flux
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
  name = "headlamp-plugin-flux";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "headlamp-plugin-flux-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "headlamp plugin flux";
      "org.opencontainers.image.description" = "headlamp-plugin-flux container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
