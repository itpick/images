{ mkImage, pkgs, lib, ... }:

# health-checker - a simple HTTP server for health-checking TCP ports
# https://github.com/gruntwork-io/health-checker

let
  version = "0.0.8";

  drv = pkgs.stdenv.mkDerivation {
    pname = "health-checker";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/gruntwork-io/health-checker/releases/download/v${version}/health-checker_linux_amd64";
      hash = "sha256-DHm6VNavhPsoXia+dP0IwrMYtdDkXZiK+kq+V6S4xFA=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/health-checker
      runHook postInstall
    '';

    meta = with lib; {
      description = "A simple HTTP server for health-checking TCP ports";
      homepage = "https://github.com/gruntwork-io/health-checker";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "health-checker";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/health-checker" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "health-checker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
