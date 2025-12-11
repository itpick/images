# minio-operator-sidecar
# =============
# MinIO Operator Sidecar - Sidecar container for MinIO tenants
# https://github.com/minio/operator

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# MinIO Operator Sidecar runs alongside MinIO pods for cluster management

let
  version = "7.1.0";
  minio-operator-sidecar = buildGoModule {
    pname = "minio-operator-sidecar";
    inherit version;

    src = fetchFromGitHub {
      owner = "minio";
      repo = "operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    sourceRoot = "source/sidecar";

    subPackages = [ "cmd/sidecar" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/minio/operator/pkg.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/sidecar $out/bin/minio-operator-sidecar
    '';

    meta = with lib; {
      description = "MinIO Operator Sidecar for tenant management";
      homepage = "https://github.com/minio/operator";
      license = licenses.agpl3Only;
    };
  };

in
mkImage {
  drv = minio-operator-sidecar;
  name = "minio-operator-sidecar";
  tag = "v${version}";
  entrypoint = [ "${minio-operator-sidecar}/bin/minio-operator-sidecar" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Operator Sidecar";
    "org.opencontainers.image.description" = "Sidecar container for MinIO tenant management";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "minio-operator";
  };
}
