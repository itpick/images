{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xcb-util-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xcb-util-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xcb-util-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xcb-util-dev";
    homepage = "https://github.com/TODO/xcb-util-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
