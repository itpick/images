{ lib, stdenv, fetchFromGitHub, ... }:

# Package: font-opensans
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "font-opensans";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "font-opensans";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for font-opensans";
    homepage = "https://github.com/TODO/font-opensans";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
