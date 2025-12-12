{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-plugin-for-microsoft-azure
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
  name = "velero-plugin-for-microsoft-azure";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-plugin-for-microsoft-azure-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "velero plugin for microsoft azure";
      "org.opencontainers.image.description" = "velero-plugin-for-microsoft-azure container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
