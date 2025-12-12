{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gnu-libiconv
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
  name = "gnu-libiconv";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gnu-libiconv-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gnu liuiconv";
      "org.opencontainers.image.description" = "gnu-libiconv container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
