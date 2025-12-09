{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openexr-libilmthread
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openexr-libilmthread";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openexr-libilmthread";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openexr-libilmthread";
    homepage = "https://github.com/TODO/openexr-libilmthread";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
