{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-restore-helper
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
  name = "velero-restore-helper";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-restore-helper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "velero restore helper";
      "org.opencontainers.image.description" = "velero-restore-helper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
