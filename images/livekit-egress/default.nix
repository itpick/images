{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# livekit-egress
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
  name = "livekit-egress";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "livekit-egress-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "livekit egress";
      "org.opencontainers.image.description" = "livekit-egress container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
