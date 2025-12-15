{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dumb-init-privileged-netbindservice
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
  name = "dumb-init-privileged-netbindservice";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dumb-init-privileged-netbindservice-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dumu init privileged netuindservice";
      "org.opencontainers.image.description" = "dumb-init-privileged-netbindservice container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
