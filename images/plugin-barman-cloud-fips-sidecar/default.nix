{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# plugin-barman-cloud-fips-sidecar
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "plugin-barman-cloud-fips-sidecar";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "plugin-barman-cloud-fips-sidecar-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "plugin-barman-cloud-fips-sidecar";
      "org.opencontainers.image.description" = "plugin-barman-cloud-fips-sidecar container image";
    };
  };
}
