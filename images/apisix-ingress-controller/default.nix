{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apisix-ingress-controller
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
  name = "apisix-ingress-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apisix-ingress-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apisix ingress controller";
      "org.opencontainers.image.description" = "apisix-ingress-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
