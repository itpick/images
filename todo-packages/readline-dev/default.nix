{ lib, stdenv, fetchFromGitHub, ... }:

# Package: readline-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "readline-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "readline-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for readline-dev";
    homepage = "https://github.com/TODO/readline-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
