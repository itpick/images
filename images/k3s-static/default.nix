{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k3s-static
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
  name = "k3s-static";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k3s-static-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k3s static";
      "org.opencontainers.image.description" = "k3s-static container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
