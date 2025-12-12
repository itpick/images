{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gnupg-dirmngr
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
  name = "gnupg-dirmngr";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gnupg-dirmngr-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gnupg dirmngr";
      "org.opencontainers.image.description" = "gnupg-dirmngr container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
