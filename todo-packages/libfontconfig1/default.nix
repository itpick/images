{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libfontconfig1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libfontconfig1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libfontconfig1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libfontconfig1";
    homepage = "https://github.com/TODO/libfontconfig1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
