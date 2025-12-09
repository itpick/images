{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libfastjson
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libfastjson";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libfastjson";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libfastjson";
    homepage = "https://github.com/TODO/libfastjson";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
