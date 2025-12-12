{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nvidia-device-plugin-fips
# NVIDIA component for container/GPU workloads

let
  version = "1.0.0";
  
  nvidiaPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "nvidia-device-plugin-fips";
  tag = version;

  copyToRoot = [
    (buildEnv {
      name = "nvidia-device-plugin-fips-root";
      paths = base.basePackages ++ nvidiaPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nvidia device plugin fips";
      "org.opencontainers.image.description" = "NVIDIA nvidia-device-plugin-fips";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
