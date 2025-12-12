{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-controller-fips
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
  name = "neuvector-controller-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "neuvector-controller-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector-controller-fips";
      "org.opencontainers.image.description" = "neuvector-controller-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
