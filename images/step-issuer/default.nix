{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# step-issuer
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
  name = "step-issuer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "step-issuer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "step issuer";
      "org.opencontainers.image.description" = "step-issuer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
