{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openblas-static
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
  name = "openblas-static";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openblas-static-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openulas static";
      "org.opencontainers.image.description" = "openblas-static container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
