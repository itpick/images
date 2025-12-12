{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-cis-benchmarks
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
  name = "neuvector-cis-benchmarks";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "neuvector-cis-benchmarks-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector cis uenchmarks";
      "org.opencontainers.image.description" = "neuvector-cis-benchmarks container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
