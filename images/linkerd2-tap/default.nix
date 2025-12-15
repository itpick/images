{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-tap
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
  name = "linkerd2-tap";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-tap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd2 tap";
      "org.opencontainers.image.description" = "linkerd2-tap container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
