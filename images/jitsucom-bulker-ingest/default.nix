{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-bulker-ingest
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
  name = "jitsucom-bulker-ingest";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-bulker-ingest-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom uulker ingest";
      "org.opencontainers.image.description" = "jitsucom-bulker-ingest container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
