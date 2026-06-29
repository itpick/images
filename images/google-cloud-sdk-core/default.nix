{ mkImage, pkgs, lib, ... }:

# Google Cloud CLI (gcloud) - core component of the Google Cloud SDK
# Upstream prebuilt linux x86_64 release tarball from dl.google.com
# https://cloud.google.com/sdk/docs/install

let
  version = "574.0.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "google-cloud-sdk-core";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${version}-linux-x86_64.tar.gz";
      hash = "sha256:0fsdvnpca3jqq9hnkmicjc2s2fpw8267qg88nc9zcb1d3rg6alfx";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    # Libraries needed by the bundled CPython interpreter shipped in the tarball.
    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      bzip2
      xz
      libffi
      ncurses
      readline
      sqlite
      gdbm
      expat
      util-linux  # libuuid
    ];

    # Tarball extracts to a single top-level "google-cloud-sdk" directory.
    sourceRoot = "google-cloud-sdk";

    # The bundled python has many optional shared-lib lookups; don't hard-fail.
    autoPatchelfIgnoreMissingDeps = true;
    dontStrip = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/google-cloud-sdk
      cp -r . $out/google-cloud-sdk/
      mkdir -p $out/bin
      ln -s $out/google-cloud-sdk/bin/gcloud $out/bin/gcloud
      ln -s $out/google-cloud-sdk/bin/gsutil $out/bin/gsutil
      ln -s $out/google-cloud-sdk/bin/bq $out/bin/bq
      runHook postInstall
    '';

    meta = with lib; {
      description = "Google Cloud CLI (gcloud) core component";
      homepage = "https://cloud.google.com/sdk";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "google-cloud-sdk-core";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/gcloud" ];
  cmd = [ "--help" ];

  env = {
    CLOUDSDK_PYTHON = "${drv}/google-cloud-sdk/platform/bundledpythonunix/bin/python3";
  };

  labels = {
    "org.opencontainers.image.title" = "google-cloud-sdk-core";
    "org.opencontainers.image.description" = "Google Cloud CLI (gcloud) core component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
