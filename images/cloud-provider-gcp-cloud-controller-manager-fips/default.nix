{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-gcp-cloud-controller-manager-fips
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
  name = "cloud-provider-gcp-cloud-controller-manager-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-gcp-cloud-controller-manager-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cloud-provider-gcp-cloud-controller-manager-fips";
      "org.opencontainers.image.description" = "cloud-provider-gcp-cloud-controller-manager-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
