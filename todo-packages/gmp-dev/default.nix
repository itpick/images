{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gmp-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gmp-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gmp-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gmp-dev";
    homepage = "https://github.com/TODO/gmp-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
