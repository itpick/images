{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.27.1";
  cloudnative-pg = buildGoModule {
    pname = "cloudnative-pg";
    inherit version;

    src = fetchFromGitHub {
      owner = "cloudnative-pg";
      repo = "cloudnative-pg";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/cloudnative-pg/cloudnative-pg/pkg/versions.buildVersion=${version}"
    ];

    subPackages = [ "cmd/manager" ];

    postInstall = ''
      mv $out/bin/manager $out/bin/cloudnative-pg
    '';

    doCheck = false;

    meta = with lib; {
      description = "CloudNativePG is a comprehensive platform designed to manage PostgreSQL databases within Kubernetes";
      homepage = "https://github.com/cloudnative-pg/cloudnative-pg";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = cloudnative-pg;
  name = "cloudnative-pg";
  tag = "v${version}";
  entrypoint = [ "${cloudnative-pg}/bin/cloudnative-pg" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "CloudNativePG Operator";
    "org.opencontainers.image.description" = "PostgreSQL operator for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cloudnative-pg";
  };
}
