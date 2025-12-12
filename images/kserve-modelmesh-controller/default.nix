{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-modelmesh-controller
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "kserve-modelmesh-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kserve-modelmesh-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kserve-modelmesh-controller";
      "org.opencontainers.image.description" = "kserve-modelmesh-controller container image";
    };
  };
}
