{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-sessions
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
  name = "selenium-sessions";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "selenium-sessions-root";
      paths = base.basePackages ++ seleniumPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "selenium-sessions";
      "org.opencontainers.image.description" = "Selenium selenium-sessions";
    };
  };
}
