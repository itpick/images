{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tesseract-osd
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tesseract-osd";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tesseract-osd";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tesseract-osd";
    homepage = "https://github.com/TODO/tesseract-osd";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
