{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xcb-util
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xcb-util";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xcb-util";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xcb-util";
    homepage = "https://github.com/TODO/xcb-util";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
