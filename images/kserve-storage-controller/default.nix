{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-storage-controller
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
  name = "kserve-storage-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kserve-storage-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kserve storage controller";
      "org.opencontainers.image.description" = "kserve-storage-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
