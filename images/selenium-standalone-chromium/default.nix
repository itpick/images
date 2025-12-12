{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-standalone-chromium
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
  name = "selenium-standalone-chromium";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-standalone-chromium-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "selenium-standalone-chromium";
      "org.opencontainers.image.description" = "Selenium selenium-standalone-chromium";
    };
  };
}
