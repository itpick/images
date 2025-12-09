{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xorg-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xorg-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xorg-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xorg-server";
    homepage = "https://github.com/TODO/xorg-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
