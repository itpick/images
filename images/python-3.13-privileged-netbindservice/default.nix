{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# python-3.13-privileged-netbindservice
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
  name = "python-3.13-privileged-netbindservice";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "python-3.13-privileged-netbindservice-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "python 3.13 privileged netuindservice";
      "org.opencontainers.image.description" = "python-3.13-privileged-netbindservice container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
