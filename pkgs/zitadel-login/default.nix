# ZITADEL Login - Next.js-based login UI for ZITADEL
# https://github.com/zitadel/zitadel (apps/login/)
#
# This is a standalone Next.js application that provides the login UI
# for ZITADEL identity management. It is built from the apps/login/
# directory of the zitadel/zitadel monorepo and runs on Node.js.
#
# Since the application is a complex pnpm monorepo with workspace
# dependencies (@zitadel/client, @zitadel/proto), we extract the
# pre-built standalone output from the upstream Docker image.

{ lib, stdenv, dockerTools, undocker }:

let
  version = "4.10.1";

  # Pull the upstream image (architecture-specific)
  upstreamImage = dockerTools.pullImage ({
    imageName = "ghcr.io/zitadel/zitadel-login";
    finalImageTag = "v${version}";
  } // (if stdenv.hostPlatform.isAarch64 then {
    imageDigest = "sha256:5059b177f1540809c4d4c7b2a9688b3a8923da148e96822b68225d7379a09cf7";
    hash = "sha256-kPZ1HKtoxPRVNbdRg1V1Ab/2JMXQ3bY+ByLOUMAJHlc=";
  } else {
    imageDigest = "sha256:65f24ba20cb3b2836c1336af11a37514d2dec5e0aa691f37560975d37c4fecf9";
    hash = "sha256-KYI/t1eR5/lMCN2FQiDz1xnCP+WcBcX6jCt4LeV96g8=";
  }));

in stdenv.mkDerivation {
  pname = "zitadel-login";
  inherit version;

  src = upstreamImage;

  nativeBuildInputs = [ undocker ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/zitadel-login

    # Extract the /app directory from the upstream image
    undocker $src - | tar -xf - -C $out/lib/zitadel-login --strip-components=1 app/

    runHook postInstall
  '';

  meta = with lib; {
    description = "ZITADEL Login UI - Next.js-based login interface for ZITADEL";
    homepage = "https://github.com/zitadel/zitadel";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
