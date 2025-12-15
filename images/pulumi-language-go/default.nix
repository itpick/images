{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pulumi-language-go
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
  name = "pulumi-language-go";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pulumi-language-go-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pulumi language go";
      "org.opencontainers.image.description" = "pulumi-language-go container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
