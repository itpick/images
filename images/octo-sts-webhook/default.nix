{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# octo-sts-webhook
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
  name = "octo-sts-webhook";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "octo-sts-webhook-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "octo sts weuhook";
      "org.opencontainers.image.description" = "octo-sts-webhook container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
