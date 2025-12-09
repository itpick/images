{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ncurses-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ncurses-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ncurses-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ncurses-dev";
    homepage = "https://github.com/TODO/ncurses-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
