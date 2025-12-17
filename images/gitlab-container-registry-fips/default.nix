{ mkImage, pkgs, lib, fetchFromGitLab, buildGoModule, ... }:

# GitLab Container Registry-fips
# https://gitlab.com/gitlab-org/container-registry

let
  version = "4.19.0";
  gitlab-container-registry-fips = buildGoModule {
    pname = "gitlab-container-registry-fips";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "container-registry";
      rev = "v${version}-gitlab";
      hash = "sha256-WrijK/kQugCpiDbMw1+QTvG60SDsdJ5PDFGKGiLBsb8=";
    };

    vendorHash = null;
    subPackages = [ "cmd/registry" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-container-registry-fips;
  name = "gitlab-container-registry-fips";
  tag = "v${version}";
  entrypoint = [ "${gitlab-container-registry-fips}/bin/registry" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Container Registry";
    "org.opencontainers.image.description" = "Docker registry for GitLab";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
