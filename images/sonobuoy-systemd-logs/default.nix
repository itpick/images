{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sonobuoy-systemd-logs
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
  name = "sonobuoy-systemd-logs";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sonobuoy-systemd-logs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sonouuoy systemd logs";
      "org.opencontainers.image.description" = "sonobuoy-systemd-logs container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
