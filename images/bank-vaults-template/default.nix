{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bank-vaults-template
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
  name = "bank-vaults-template";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bank-vaults-template-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uank vaults template";
      "org.opencontainers.image.description" = "bank-vaults-template container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
