{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-host
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
  name = "azure-functions-host";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-host-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "azure functions host";
      "org.opencontainers.image.description" = "azure-functions-host container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
