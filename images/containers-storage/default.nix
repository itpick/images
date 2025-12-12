{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# containers-storage
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
  name = "containers-storage";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "containers-storage-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "containers storage";
      "org.opencontainers.image.description" = "containers-storage container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
