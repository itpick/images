{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lcms2-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lcms2-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lcms2-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lcms2-dev";
    homepage = "https://github.com/TODO/lcms2-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
