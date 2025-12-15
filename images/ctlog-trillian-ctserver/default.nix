{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ctlog-trillian-ctserver
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "ctlog-trillian-ctserver";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ctlog-trillian-ctserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ctlog-trillian-ctserver";
      "org.opencontainers.image.description" = "ctlog-trillian-ctserver container image";
    };
  };
}
