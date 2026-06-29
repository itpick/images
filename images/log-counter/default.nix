{ mkImage, pkgs, lib, ... }:

# log-counter - log pattern counter shipped with node-problem-detector
# https://github.com/kubernetes/node-problem-detector

let
  version = "1.35.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "log-counter";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes/node-problem-detector/releases/download/v${version}/node-problem-detector-v${version}-linux_amd64.tar.gz";
      hash = "sha256:1zqf158nj2rp1hag7m674a9468k5ip8lb1rzalmvla2dq5cyxkza";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/log-counter $out/bin/log-counter
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "log-counter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/log-counter" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "log-counter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
