# harbor-registryctl
# =============
# Harbor Registry Controller - Registry management for Harbor
# https://github.com/goharbor/harbor

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Registryctl manages the registry component lifecycle

let
  version = "2.14.1";
  harbor-registryctl = buildGoModule {
    pname = "harbor-registryctl";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor";
      rev = "v${version}";
      hash = "sha256-j0Eps47o8OxWaWzvutVIvzj+hX9jmB9qRrPKYNIXfRs=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-j0Eps47o8OxWaWzvutVIvzj+hX9jmB9qRrPKYNIXfRs=";  # TODO: Fix hash after first build

    sourceRoot = "source/src";

    subPackages = [ "registryctl" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/goharbor/harbor/src/common/utils.ReleaseVersion=v${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/registryctl $out/bin/harbor-registryctl
    '';

    meta = with lib; {
      description = "Harbor Registry Controller - Registry management";
      homepage = "https://github.com/goharbor/harbor";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-registryctl;
  name = "harbor-registryctl";
  tag = "v${version}";
  entrypoint = [ "${harbor-registryctl}/bin/harbor-registryctl" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Harbor Registry Controller";
    "org.opencontainers.image.description" = "Registry management component for Harbor";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
