{ lib, stdenv, fetchFromGitHub, ... }:

# Package: livekit-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "livekit-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "livekit-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for livekit-server-fips";
    homepage = "https://github.com/TODO/livekit-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
