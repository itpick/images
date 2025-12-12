{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# orthanc-python
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
  name = "orthanc-python";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "orthanc-python-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "orthanc python";
      "org.opencontainers.image.description" = "orthanc-python container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
