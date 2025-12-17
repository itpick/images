{ mkImage, pkgs, lib, fetchFromGitLab, buildGoModule, ... }:

# GitLab Pages-fips
# https://gitlab.com/gitlab-org/gitlab-pages

let
  version = "17.10.1";
  gitlab-pages-fips = buildGoModule {
    pname = "gitlab-pages-fips";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "gitlab-pages";
      rev = "v${version}";
      hash = "sha256-B/v0jj5hoNmF9cygvi9eLQ4pLuZ1+wIyNnJN2uCAXdE=";
    };

    vendorHash = null;
    subPackages = [ "." ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-pages-fips;
  name = "gitlab-pages-fips";
  tag = "v${version}";
  entrypoint = [ "${gitlab-pages-fips}/bin/gitlab-pages" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Pages";
    "org.opencontainers.image.description" = "Static site hosting for GitLab";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
