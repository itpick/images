{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-controller
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
  name = "linkerd2-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd2 controller";
      "org.opencontainers.image.description" = "linkerd2-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
