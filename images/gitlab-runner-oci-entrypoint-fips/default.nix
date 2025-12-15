{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab runner oci entrypoint-fips
# GitLab component: runner-oci-entrypoint

let
  componentPkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "gitlab-runner-oci-entrypoint-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-runner-oci-entrypoint-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab runner oci entrypoint";
      "org.opencontainers.image.description" = "GitLab runner-oci-entrypoint component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
