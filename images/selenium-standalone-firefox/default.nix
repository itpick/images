{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-standalone-firefox
# Selenium component

let
  seleniumPkgs = with pkgs; [
    selenium-server-standalone
    chromium
    firefox
    jdk21
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "selenium-standalone-firefox";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-standalone-firefox-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "selenium-standalone-firefox";
      "org.opencontainers.image.description" = "Selenium selenium-standalone-firefox";
    };
  };
}
