{ lib, stdenv, fetchFromGitHub, ... }:

# Package: livekit-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "livekit-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "livekit-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for livekit-server";
    homepage = "https://github.com/TODO/livekit-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
