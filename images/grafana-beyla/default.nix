{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# grafana-beyla
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
  name = "grafana-beyla";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "grafana-beyla-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "grafana ueyla";
      "org.opencontainers.image.description" = "grafana-beyla container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
