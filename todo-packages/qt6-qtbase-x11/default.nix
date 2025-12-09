{ lib, stdenv, fetchFromGitHub, ... }:

# Package: qt6-qtbase-x11
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "qt6-qtbase-x11";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "qt6-qtbase-x11";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for qt6-qtbase-x11";
    homepage = "https://github.com/TODO/qt6-qtbase-x11";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
