# minio-operator
# =============
# MinIO Operator - Kubernetes Operator for MinIO object storage
# https://github.com/minio/operator

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# MinIO Operator for deploying and managing MinIO clusters on Kubernetes

let
  version = "7.1.0";
  minio-operator = buildGoModule {
    pname = "minio-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "minio";
      repo = "operator";
      rev = "v${version}";
      hash = "sha256-K+q1cL1q5InBTA35R35aPvab17pNrlL0t6iDarWPbdI=";
    };

    vendorHash = "sha256-SJTFdJdEjtwAXGvBEa6lHQ3AaJcABEc6ER9ZmLGDccU=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/operator" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/minio/operator/pkg/version.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/operator $out/bin/minio-operator
    '';

    meta = with lib; {
      description = "MinIO Operator for Kubernetes";
      homepage = "https://github.com/minio/operator";
      license = licenses.agpl3Only;
    };
  };

in
mkImage {
  drv = minio-operator;
  name = "minio-operator";
  tag = "v${version}";
  entrypoint = [ "${minio-operator}/bin/minio-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Operator";
    "org.opencontainers.image.description" = "Kubernetes Operator for MinIO object storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "minio-operator";
  };
}
