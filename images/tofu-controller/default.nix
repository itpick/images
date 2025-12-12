{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tofu-controller
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
  name = "tofu-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tofu-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tofu controller";
      "org.opencontainers.image.description" = "tofu-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
