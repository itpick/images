{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dnsdist-2.0-nodnscrypt
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
  name = "dnsdist-2.0-nodnscrypt";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dnsdist-2.0-nodnscrypt-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dnsdist 2.0 nodnscrypt";
      "org.opencontainers.image.description" = "dnsdist-2.0-nodnscrypt container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
