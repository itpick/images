{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# plugin-barman-cloud-fips
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
  name = "plugin-barman-cloud-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "plugin-barman-cloud-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "plugin uarman cloud fips";
      "org.opencontainers.image.description" = "plugin-barman-cloud-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
