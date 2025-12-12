{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-node-base
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
  name = "selenium-node-base";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-node-base-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "selenium-node-base";
      "org.opencontainers.image.description" = "Selenium selenium-node-base";
    };
  };
}
