{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# glibc-iconv
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
  name = "glibc-iconv";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "glibc-iconv-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gliuc iconv";
      "org.opencontainers.image.description" = "glibc-iconv container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
