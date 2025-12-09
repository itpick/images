{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libexpat1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libexpat1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libexpat1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libexpat1";
    homepage = "https://github.com/TODO/libexpat1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
