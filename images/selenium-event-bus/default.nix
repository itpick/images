{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-event-bus
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
  name = "selenium-event-bus";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-event-bus-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "selenium-event-bus";
      "org.opencontainers.image.description" = "Selenium selenium-event-bus";
    };
  };
}
