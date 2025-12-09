{ lib, stdenv, fetchFromGitHub, ... }:

# Package: r-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "r-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "r-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for r-dev";
    homepage = "https://github.com/TODO/r-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
