{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# yunikorn-k8shim-fips
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
  name = "yunikorn-k8shim-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "yunikorn-k8shim-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "yunikorn k8shim fips";
      "org.opencontainers.image.description" = "yunikorn-k8shim-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
