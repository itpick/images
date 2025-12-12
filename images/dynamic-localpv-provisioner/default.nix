{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dynamic-localpv-provisioner
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
  name = "dynamic-localpv-provisioner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dynamic-localpv-provisioner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dynamic localpv provisioner";
      "org.opencontainers.image.description" = "dynamic-localpv-provisioner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
