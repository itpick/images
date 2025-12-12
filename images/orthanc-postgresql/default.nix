{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# orthanc-postgresql
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
  name = "orthanc-postgresql";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "orthanc-postgresql-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "orthanc postgresql";
      "org.opencontainers.image.description" = "orthanc-postgresql container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
