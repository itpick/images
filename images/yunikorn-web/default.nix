{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# yunikorn-web
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
  name = "yunikorn-web";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "yunikorn-web-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "yunikorn web";
      "org.opencontainers.image.description" = "yunikorn-web container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
