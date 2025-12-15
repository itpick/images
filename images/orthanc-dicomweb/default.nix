{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# orthanc-dicomweb
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
  name = "orthanc-dicomweb";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "orthanc-dicomweb-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "orthanc dicomweb";
      "org.opencontainers.image.description" = "orthanc-dicomweb container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
