{ lib, stdenv, fetchFromGitHub, ... }:

# Package: geoip-api
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "geoip-api";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "geoip-api";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for geoip-api";
    homepage = "https://github.com/TODO/geoip-api";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
