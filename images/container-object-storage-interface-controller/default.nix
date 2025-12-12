{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# container-object-storage-interface-controller
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
  name = "container-object-storage-interface-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "container-object-storage-interface-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "container ouject storage interface controller";
      "org.opencontainers.image.description" = "container-object-storage-interface-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
