{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-host-python3.13-worker
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
  name = "azure-functions-host-python3.13-worker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-host-python3.13-worker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "azure functions host python3.13 worker";
      "org.opencontainers.image.description" = "azure-functions-host-python3.13-worker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
