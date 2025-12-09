{ lib, stdenv, fetchFromGitHub, ... }:

# Package: scanelf
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "scanelf";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "scanelf";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for scanelf";
    homepage = "https://github.com/TODO/scanelf";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
