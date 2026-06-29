{ mkImage, pkgs, lib, ... }:

# policy-bot - GitHub App for enforcing approval policies on pull requests
# https://github.com/palantir/policy-bot

let
  version = "1.41.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "policy-bot";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/palantir/policy-bot/releases/download/v${version}/policy-bot-${version}.tgz";
      hash = "sha256:0lwn88007ymbab7j4dffd7k6ki03x41mxhyi51cvw3xgyvcr61xv";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 policy-bot-${version}/bin/linux-amd64/policy-bot $out/bin/policy-bot
      mkdir -p $out/share/policy-bot
      cp -r policy-bot-${version}/static policy-bot-${version}/templates $out/share/policy-bot/
      runHook postInstall
    '';

    meta = with lib; {
      description = "GitHub App for enforcing approval policies on pull requests";
      homepage = "https://github.com/palantir/policy-bot";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "policy-bot";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/policy-bot" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "policy-bot";
    "org.opencontainers.image.description" = "GitHub App for enforcing approval policies on pull requests";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
