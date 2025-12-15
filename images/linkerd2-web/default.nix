{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-web
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
  name = "linkerd2-web";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-web-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd2 web";
      "org.opencontainers.image.description" = "linkerd2-web container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
