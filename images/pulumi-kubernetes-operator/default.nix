{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pulumi-kubernetes-operator
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
  name = "pulumi-kubernetes-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pulumi-kubernetes-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pulumi kuuernetes operator";
      "org.opencontainers.image.description" = "pulumi-kubernetes-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
