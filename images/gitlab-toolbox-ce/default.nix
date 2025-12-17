{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# gitlab-toolbox-ce
# GitLab component

let
  version = "17.6.0";
  component = buildGoModule {
    pname = "gitlab-toolbox-ce";
    inherit version;
    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "gitlab-foss";
      rev = "v${version}";
      hash = "sha256-2dZumkupbqOouKZaPPnKAVINjiLFW63wYVNj0klvRoo=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "gitlab-toolbox-ce";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/gitlab-toolbox-ce" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata git ];
  labels = {
    "org.opencontainers.image.title" = "gitlab-toolbox-ce";
    "org.opencontainers.image.description" = "GitLab gitlab-toolbox-ce";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
  };
}
