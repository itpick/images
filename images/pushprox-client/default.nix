{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pushprox-client
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
  name = "pushprox-client";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pushprox-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pushprox client";
      "org.opencontainers.image.description" = "pushprox-client container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
