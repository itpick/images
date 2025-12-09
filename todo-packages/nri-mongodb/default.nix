{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-mongodb
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-mongodb";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-mongodb";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-mongodb";
    homepage = "https://github.com/TODO/nri-mongodb";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
