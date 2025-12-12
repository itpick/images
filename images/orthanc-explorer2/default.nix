{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# orthanc-explorer2
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
  name = "orthanc-explorer2";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "orthanc-explorer2-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "orthanc explorer2";
      "org.opencontainers.image.description" = "orthanc-explorer2 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
