{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# busybox-full
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
  name = "busybox-full";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "busybox-full-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uusyuox full";
      "org.opencontainers.image.description" = "busybox-full container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
