{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trillian-logserver
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
  name = "trillian-logserver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trillian-logserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trillian logserver";
      "org.opencontainers.image.description" = "trillian-logserver container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
