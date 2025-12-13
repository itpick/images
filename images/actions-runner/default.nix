{ mkImage, pkgs, lib, ... }:

# GitHub Actions Runner - self-hosted runner for GitHub Actions
# https://github.com/actions/runner

let
  version = "2.330.0";

  arch = if pkgs.stdenv.hostPlatform.isAarch64 then "arm64" else "x64";

  hashes = {
    x64 = "sha256-r1wz+pTzzDO46Xk3k5E2prBBl+ba38+ztuM64b9B55o=";
    arm64 = "sha256-nLQ1J5EghsfI+0EZywZAn8vL1vk6LYUH8wsHxJViD1w=";
  };

  actions-runner = pkgs.stdenv.mkDerivation rec {
    pname = "actions-runner";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-${arch}-${version}.tar.gz";
      hash = hashes.${arch};
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      zlib
      openssl
      icu
      curl
      libkrb5
      stdenv.cc.cc.lib
      lttng-ust
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/runner
      cp -r . $out/runner/
      mkdir -p $out/bin
      ln -s $out/runner/run.sh $out/bin/run.sh
      ln -s $out/runner/config.sh $out/bin/config.sh
      chmod +x $out/runner/run.sh $out/runner/config.sh
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "GitHub Actions self-hosted runner";
      homepage = "https://github.com/actions/runner";
      license = licenses.mit;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in mkImage {
  drv = actions-runner;
  name = "actions-runner";
  tag = "v${version}";
  entrypoint = [ "${actions-runner}/runner/run.sh" ];
  cmd = [];

  extraPkgs = with pkgs; [
    git
    curl
    jq
    nodejs
    docker-client
  ];

  user = "0:0";  # Runs as root by default for docker-in-docker

  labels = {
    "org.opencontainers.image.title" = "GitHub Actions Runner";
    "org.opencontainers.image.description" = "Self-hosted runner for GitHub Actions";
    "org.opencontainers.image.version" = version;
  };
}
