{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bash-binsh
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bash-binsh";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bash-binsh";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bash-binsh";
    homepage = "https://github.com/TODO/bash-binsh";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
