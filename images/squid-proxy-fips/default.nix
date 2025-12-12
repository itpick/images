{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# squid-proxy-fips
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
  name = "squid-proxy-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "squid-proxy-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "squid-proxy-fips";
      "org.opencontainers.image.description" = "squid-proxy-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
