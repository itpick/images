{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# objectstorage-controller
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
  name = "objectstorage-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "objectstorage-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "objectstorage-controller";
      "org.opencontainers.image.description" = "objectstorage-controller container image";
    };
  };
}
