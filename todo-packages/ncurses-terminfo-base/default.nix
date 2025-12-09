{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ncurses-terminfo-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ncurses-terminfo-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ncurses-terminfo-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ncurses-terminfo-base";
    homepage = "https://github.com/TODO/ncurses-terminfo-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
