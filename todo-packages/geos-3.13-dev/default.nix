{ lib, stdenv, fetchFromGitHub, ... }:

# Package: geos-3.13-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "geos-3.13-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "geos-3.13-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for geos-3.13-dev";
    homepage = "https://github.com/TODO/geos-3.13-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
