{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openexr-libiex
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openexr-libiex";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openexr-libiex";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openexr-libiex";
    homepage = "https://github.com/TODO/openexr-libiex";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
