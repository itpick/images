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
      "org.opencontainers.image.title" = "promitor-agent-scraper-fips";
      "org.opencontainers.image.description" = "promitor-agent-scraper-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
