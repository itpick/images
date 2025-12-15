{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# promitor-agent-scraper-fips
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
  name = "promitor-agent-scraper-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "promitor-agent-scraper-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "promitor-agent-scraper-fips";
      "org.opencontainers.image.description" = "promitor-agent-scraper-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
