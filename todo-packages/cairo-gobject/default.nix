{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cairo-gobject
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cairo-gobject";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cairo-gobject";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cairo-gobject";
    homepage = "https://github.com/TODO/cairo-gobject";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
