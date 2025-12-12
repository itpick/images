{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-debug
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
  name = "linkerd2-debug";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-debug-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd2 deuug";
      "org.opencontainers.image.description" = "linkerd2-debug container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
