{ mkImage, pkgs, lib, ... }:

# http-echo - tiny HTTP server that echoes a response (HashiCorp)
# https://github.com/hashicorp/http-echo
let
  version = "1.0.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "http-echo";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://releases.hashicorp.com/http-echo/${version}/http-echo_${version}_linux_amd64.zip";
      hash = "sha256:0wg4gpa5h6kc3ngvcrm9q36y7dd4kn88l2wj125vr6ilnpal8h9y";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 http-echo $out/bin/http-echo
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "http-echo";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/http-echo" ];
  cmd = [ "-version" ];
  labels = {
    "org.opencontainers.image.title" = "http-echo";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
