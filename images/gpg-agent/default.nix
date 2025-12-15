{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpg-agent
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
  name = "gpg-agent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gpg-agent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gpg agent";
      "org.opencontainers.image.description" = "gpg-agent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
