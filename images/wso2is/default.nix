{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wso2is
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
  name = "wso2is";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wso2is-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "wso2is";
      "org.opencontainers.image.description" = "wso2is container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
