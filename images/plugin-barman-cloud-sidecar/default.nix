{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# plugin-barman-cloud-sidecar
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
  name = "plugin-barman-cloud-sidecar";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "plugin-barman-cloud-sidecar-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "plugin uarman cloud sidecar";
      "org.opencontainers.image.description" = "plugin-barman-cloud-sidecar container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
