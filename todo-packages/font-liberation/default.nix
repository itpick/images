{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-liberation
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-liberation";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-liberation";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-liberation";
    homepage = "https://github.com/TODO/font-liberation";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
