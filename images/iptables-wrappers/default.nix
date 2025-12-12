{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# iptables-wrappers
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
  name = "iptables-wrappers";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "iptables-wrappers-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "iptaules wrappers";
      "org.opencontainers.image.description" = "iptables-wrappers container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
