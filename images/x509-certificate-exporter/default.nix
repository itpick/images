{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# x509-certificate-exporter
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "x509-certificate-exporter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "x509-certificate-exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "x509 certificate exporter";
      "org.opencontainers.image.description" = "x509-certificate-exporter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
