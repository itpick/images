{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libtbb
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libtbb";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libtbb";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libtbb";
    homepage = "https://github.com/TODO/libtbb";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
