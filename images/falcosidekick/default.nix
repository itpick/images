{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falcosidekick
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
  name = "falcosidekick";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "falcosidekick-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falcosidekick";
      "org.opencontainers.image.description" = "falcosidekick container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
