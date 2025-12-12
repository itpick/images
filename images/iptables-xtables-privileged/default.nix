{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# iptables-xtables-privileged
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
  name = "iptables-xtables-privileged";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "iptables-xtables-privileged-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "iptaules xtaules privileged";
      "org.opencontainers.image.description" = "iptables-xtables-privileged container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
