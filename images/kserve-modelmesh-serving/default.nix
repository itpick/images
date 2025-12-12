{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-modelmesh-serving
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
  name = "kserve-modelmesh-serving";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kserve-modelmesh-serving-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kserve modelmesh serving";
      "org.opencontainers.image.description" = "kserve-modelmesh-serving container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
