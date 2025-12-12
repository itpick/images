{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# promitor-agent-scraper
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
  name = "promitor-agent-scraper";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "promitor-agent-scraper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "promitor-agent-scraper";
      "org.opencontainers.image.description" = "promitor-agent-scraper container image";
    };
  };
}
