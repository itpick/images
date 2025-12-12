{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# yunikorn-k8shim
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
  name = "yunikorn-k8shim";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "yunikorn-k8shim-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "yunikorn k8shim";
      "org.opencontainers.image.description" = "yunikorn-k8shim container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
