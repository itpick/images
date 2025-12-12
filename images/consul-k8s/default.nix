{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# consul-k8s
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
  name = "consul-k8s";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "consul-k8s-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "consul k8s";
      "org.opencontainers.image.description" = "consul-k8s container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
