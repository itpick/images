{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tesseract-eng
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tesseract-eng";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tesseract-eng";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tesseract-eng";
    homepage = "https://github.com/TODO/tesseract-eng";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
