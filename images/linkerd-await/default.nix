{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-await
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
  name = "linkerd-await";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd-await-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd await";
      "org.opencontainers.image.description" = "linkerd-await container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
