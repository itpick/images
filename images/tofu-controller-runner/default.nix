{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tofu-controller-runner
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
  name = "tofu-controller-runner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tofu-controller-runner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tofu controller runner";
      "org.opencontainers.image.description" = "tofu-controller-runner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
