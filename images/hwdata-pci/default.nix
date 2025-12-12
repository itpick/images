{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# hwdata-pci
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
  name = "hwdata-pci";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "hwdata-pci-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "hwdata pci";
      "org.opencontainers.image.description" = "hwdata-pci container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
