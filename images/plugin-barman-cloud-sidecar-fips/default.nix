{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# plugin-barman-cloud-sidecar-fips
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
  name = "plugin-barman-cloud-sidecar-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "plugin-barman-cloud-sidecar-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "plugin uarman cloud sidecar fips";
      "org.opencontainers.image.description" = "plugin-barman-cloud-sidecar-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
