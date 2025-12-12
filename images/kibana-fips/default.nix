{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kibana-fips
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
  name = "kibana-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kibana-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kibana-fips";
      "org.opencontainers.image.description" = "kibana-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
