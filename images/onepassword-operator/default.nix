{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# onepassword-operator
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
  name = "onepassword-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "onepassword-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "onepassword operator";
      "org.opencontainers.image.description" = "onepassword-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
