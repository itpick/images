{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libarrow
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libarrow";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libarrow";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libarrow";
    homepage = "https://github.com/TODO/libarrow";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
