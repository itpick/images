{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bcfips-policy-140
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
  name = "bcfips-policy-140";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bcfips-policy-140-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ucfips policy 140";
      "org.opencontainers.image.description" = "bcfips-policy-140 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
