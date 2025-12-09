{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lame-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lame-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lame-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lame-libs";
    homepage = "https://github.com/TODO/lame-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
