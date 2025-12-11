# harbor-registry
# =============
# Harbor Registry - Container registry component
# https://github.com/goharbor/harbor
# Note: Harbor uses distribution/distribution registry

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Registry is based on distribution/distribution with Harbor extensions

let
  version = "3.0.0";
  # Harbor uses a fork of distribution registry
  harbor-registry = buildGoModule {
    pname = "harbor-registry";
    inherit version;

    src = fetchFromGitHub {
      owner = "distribution";
      repo = "distribution";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/registry" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/distribution/distribution/v3/version.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/registry $out/bin/harbor-registry
    '';

    meta = with lib; {
      description = "Harbor Registry - OCI distribution registry";
      homepage = "https://github.com/distribution/distribution";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-registry;
  name = "harbor-registry";
  tag = "v${version}";
  entrypoint = [ "${harbor-registry}/bin/harbor-registry" ];
  cmd = [ "serve" "/etc/registry/config.yml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Harbor Registry";
    "org.opencontainers.image.description" = "OCI distribution registry for Harbor";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
