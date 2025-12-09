{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-apache
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-apache";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-apache";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-apache";
    homepage = "https://github.com/TODO/nri-apache";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
