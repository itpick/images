{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# langfuse-3-worker
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
  name = "langfuse-3-worker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "langfuse-3-worker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "langfuse 3 worker";
      "org.opencontainers.image.description" = "langfuse-3-worker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
