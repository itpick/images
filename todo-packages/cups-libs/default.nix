{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cups-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cups-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cups-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cups-libs";
    homepage = "https://github.com/TODO/cups-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
