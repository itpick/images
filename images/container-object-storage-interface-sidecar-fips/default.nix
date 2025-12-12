{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# container-object-storage-interface-sidecar-fips
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
  name = "container-object-storage-interface-sidecar-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "container-object-storage-interface-sidecar-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "container ouject storage interface sidecar fips";
      "org.opencontainers.image.description" = "container-object-storage-interface-sidecar-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
