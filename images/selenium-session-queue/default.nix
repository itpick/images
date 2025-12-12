{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-session-queue
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
  name = "selenium-session-queue";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-session-queue-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "selenium-session-queue";
      "org.opencontainers.image.description" = "Selenium selenium-session-queue";
    };
  };
}
