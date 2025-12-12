{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thanos-receive-controller
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
  name = "thanos-receive-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thanos-receive-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "thanos receive controller";
      "org.opencontainers.image.description" = "thanos-receive-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
