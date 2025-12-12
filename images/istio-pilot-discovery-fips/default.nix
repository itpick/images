{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# istio-pilot-discovery-fips
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
  name = "istio-pilot-discovery-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "istio-pilot-discovery-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "istio pilot discovery fips";
      "org.opencontainers.image.description" = "istio-pilot-discovery-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
