{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# git-bootstrap
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
  name = "git-bootstrap";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "git-bootstrap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "git uootstrap";
      "org.opencontainers.image.description" = "git-bootstrap container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
