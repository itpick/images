{ mkImage, pkgs, lib, ... }:

# mc - MinIO Client
# Command-line tool for interacting with MinIO and S3-compatible object storage
#
# minio/mc was archived in November 2025; its last release
# (RELEASE.2025-08-13T08-35-41Z) vendors x/net 0.42, grpc 1.71 and friends,
# and nixpkgs now marks minio-client insecure for that reason. Build the final
# commit on master instead and bump the vulnerable modules past it, which is
# the only way left to ship fixes. Revisit the module list when grype flags a
# new one; there will be no upstream release to wait for.

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };

  rev = "77f82e18b5401a65958f1619df6ebb994634bd88";
  version = "2025-11-06T16-25-29Z";

  minio-client = pkgs.buildGoModule ({
    pname = "minio-client";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "minio";
      repo = "mc";
      inherit rev;
      hash = "sha256-wfnW8cF4S6FuC7zI3HNlXjQiMcIVzuLgIl6bABcp9FA=";
    };

    vendorHash = "sha256-k2glIU+inl7LH8hzmjN3dNi64s09U1K6JAJBQWxZ4qg=";

    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    doCheck = false;

    postPatch = ''
      sed -i "s/Version.*/Version = \"${version}\"/g" cmd/build-constants.go
      sed -i "s/ReleaseTag.*/ReleaseTag = \"DEVELOPMENT.${version}\"/g" cmd/build-constants.go
      sed -i "s/CommitID.*/CommitID = \"${rev}\"/g" cmd/build-constants.go
    '';

    meta = {
      homepage = "https://github.com/minio/mc";
      description = "MinIO Client, final upstream commit with patched dependencies";
      license = lib.licenses.agpl3Plus;
      mainProgram = "mc";
    };
  } // goModBump [
    "golang.org/x/net@v0.62.0"
    "google.golang.org/grpc@v1.83.2"
    "github.com/klauspost/compress@v1.20.2"
    "github.com/prometheus/prometheus@v0.311.3"
  ]);
in
mkImage {
  drv = minio-client;
  name = "mc";
  tag = "v${version}";
  entrypoint = [ "${minio-client}/bin/mc" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Client";
    "org.opencontainers.image.description" = "MinIO Client for object storage operations";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "minio";
  };
}
