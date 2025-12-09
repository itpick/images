{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-samyak-gujarati
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-samyak-gujarati";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-samyak-gujarati";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-samyak-gujarati";
    homepage = "https://github.com/TODO/font-samyak-gujarati";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
