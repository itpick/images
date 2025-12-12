{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ntia-conformance-checker
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
  name = "ntia-conformance-checker";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ntia-conformance-checker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ntia-conformance-checker";
      "org.opencontainers.image.description" = "ntia-conformance-checker container image";
    };
  };
}
