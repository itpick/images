{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# unoconverter
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
  name = "unoconverter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "unoconverter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "unoconverter";
      "org.opencontainers.image.description" = "unoconverter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
