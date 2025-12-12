{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# envoy-ratelimit-fips
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
  name = "envoy-ratelimit-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "envoy-ratelimit-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "envoy ratelimit fips";
      "org.opencontainers.image.description" = "envoy-ratelimit-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
