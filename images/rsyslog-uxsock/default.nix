{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rsyslog-uxsock
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
  name = "rsyslog-uxsock";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rsyslog-uxsock-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "rsyslog uxsock";
      "org.opencontainers.image.description" = "rsyslog-uxsock container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
